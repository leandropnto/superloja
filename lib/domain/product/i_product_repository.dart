import 'package:dartz/dartz.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_failure.dart';

abstract class IProductRepository {
  Stream<Either<ProductFailure, List<Product>>> watchProducts ();
}