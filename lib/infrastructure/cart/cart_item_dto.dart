import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/cart/cart_item.dart';

part 'cart_item_dto.freezed.dart';

part 'cart_item_dto.g.dart';

@freezed
abstract class CartItemDto implements _$CartItemDto {
  const factory CartItemDto({
    @JsonKey(ignore: true) String id,
    @required String productId,
    @required String sizeName,
    @required int quantity,
  }) = _CartItemDto;

  const CartItemDto._();

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);

  factory CartItemDto.fromDomain(CartItem cartItem) {
    return CartItemDto(
        id: cartItem.id,
        productId: cartItem.productId,
        sizeName: cartItem.sizeName,
        quantity: cartItem.quantity);
  }

  CartItem toDomain() {
    return CartItem(
      id: id,
      productId: productId,
      quantity: quantity,
      sizeName: sizeName,
    );
  }

  factory CartItemDto.fromFirestore(DocumentSnapshot doc) {
    return CartItemDto.fromJson(doc.data).copyWith(id: doc.documentID);
  }
}
