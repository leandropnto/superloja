part of 'cart_bloc.dart';

@freezed
abstract class CartState implements _$CartState {
  const factory CartState({
    @required final List<CartItem> cart,
    @required final List<CartProduct> cartProducts,
    @required
        final Option<Either<CartFailures, Unit>> cartFailureOrSuccessOption,
  }) = _CartState;

  factory CartState.initial() => CartState(
        cart: [],
        cartProducts: [],
        cartFailureOrSuccessOption: none(),
      );

  int get length => cartProducts.length;

  bool get isEmpty => length == 0;

  num get total => cartProducts
      .map((p) => p.size.price.value.fold((l) => 0, (r) => r) * p.quantity)
      .fold(0, (acc, element) => acc + element);

  int get itemsCount => cartProducts
      .map((e) => e.quantity)
      .fold(0, (acc, el) => acc + el);

  const CartState._();
}
