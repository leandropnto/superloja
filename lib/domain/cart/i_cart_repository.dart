import 'package:dartz/dartz.dart';
import 'package:superloja/domain/cart/cart_failures.dart';
import 'package:superloja/domain/cart/cart_item.dart';
import 'package:superloja/domain/cart/cart_product.dart';

abstract class ICartRepository {
  Stream<Either<CartFailures, List<CartItem>>> watchCart();
  Future<Option<Either<CartFailures, Unit>>> addToCart(CartProduct item);
  Future<Option<Either<CartFailures, Unit>>> removeToCart(CartProduct item);
}