import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_failure.dart';
import 'package:superloja/infrastructure/product/product_dto.dart';

@Singleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final Firestore _firestore;

  ProductRepository(this._firestore) : assert(_firestore != null);

  @override
  Stream<Either<ProductFailure, List<Product>>> watchProducts() async* {
    yield* _firestore.collection("products").snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map(
                  (doc) => ProductDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );
  }
}
