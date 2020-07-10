import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_size.dart';

part 'cart_product.freezed.dart';

@freezed
abstract class CartProduct implements _$CartProduct {
  const factory CartProduct({
    @required UniqueId id,
    @required Product product,
    @required ProductSize size,
    @required int quantity,
  }) = _CartProduct;

  const CartProduct._();

  bool isStackabel(Map<String, dynamic> cart) {
    return cart['productId'] as String == product.id.getOrCrash() &&
        cart['sizeName'] == size.sizeName.getOrCrash();
  }
}
