import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/cart/cart_product.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    @required String id,
    @required String productId,
    @required int quantity,
    @required String sizeName,
  }) = _CartItem;

  factory CartItem.empty() => const CartItem(
        id: '',
        productId: '',
        sizeName: '',
        quantity: 0,
      );

  factory CartItem.from(CartProduct cartProduct) {
    return CartItem(
      id: cartProduct.id.getOrCrash(),
      productId: cartProduct.id.getOrCrash(),
      quantity: cartProduct.quantity,
      sizeName: cartProduct.size.sizeName.getOrCrash(),
    );
  }
}
