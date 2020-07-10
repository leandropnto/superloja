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

  const CartState._();
}
