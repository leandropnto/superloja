part of 'cart_bloc.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.initial() = _Initial;
  const factory CartEvent.loading() = _Loading;
  const factory CartEvent.loaded(List<CartItem> items) = _loaded;
  const factory CartEvent.add(CartProduct cartProduct) = _Add;
  const factory CartEvent.remove(CartProduct cartProduct) = _Remove;
  const factory CartEvent.clear() = _Clear;
  const factory CartEvent.cartsReceived(
      Either<CartFailures, List<CartItem>> failureOrCart) = _CartsReceived;

  const factory CartEvent.setAddress(Address address) = _SetAddress;
}
