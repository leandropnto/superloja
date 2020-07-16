import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/infrastructure/core/file_helpers.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_failure.dart';
import 'package:superloja/infrastructure/product/product_dto.dart';
import 'package:uuid/uuid.dart';


@Singleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final Firestore _firestore;
  final FirebaseStorage _firebaseStorage;

  ProductRepository(this._firestore, this._firebaseStorage)
      : assert(_firestore != null),
        assert(_firebaseStorage != null);

  @override
  Stream<Either<ProductFailure, List<Product>>> watchProducts() async* {
    yield* _firestore.collection("products").snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map((doc) => ProductDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );
  }

  @override
  Future<Either<ProductFailure, Product>> getProduct(String id) async {
    try {
      final snapshot =
          await _firestore.collection("products").document(id).get();
      final productDto = ProductDto.fromFirestore(snapshot);
      final product = productDto.toDomain();
      return right(product);
    } catch (e) {
      return left(const ProductFailure.serverError());
    }
  }

  @override
  Future<Either<ProductFailure, Product>> save(Product product) async {
    final urls = product.images.whereType<String>().toList();
    final images = product.images.whereType<File>().toList();

    final uploades = await Future.wait(images.map((f) async {
      final reference = _firebaseStorage
          .ref()
          .child('images/products/${product.id.getOrCrash()}')
          .child('product_${product.id.getOrCrash()}_${Uuid().v1()}_${f.fileName}');

      await reference.putFile(f).onComplete;
      return reference.getDownloadURL();
    }).toList());

    try {
      final productUpdated = product.copyWith(images: [...urls, ...uploades]);
      final json = ProductDto.fromDomain(productUpdated).toJson();
      await _firestore
          .collection("products")
          .document(product.id.getOrCrash())
          .setData(json);
      return right(productUpdated);
    } catch (e) {
      return left(const ProductFailure.serverError());
    }
  }
}
