import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/cart/cart_failures.dart';
import 'package:superloja/domain/cart/cart_item.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/domain/cart/i_cart_repository.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

@Singleton()
class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _cartRepository;
  final IProductRepository _productRepository;
  StreamSubscription<Either<CartFailures, List<CartItem>>> _cartSubscription;

  CartBloc(this._cartRepository, this._productRepository)
      : assert(_cartRepository != null);

  @override
  CartState get initialState => CartState.initial();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    yield* event.map(
      initial: (e) async* {
        add(const CartEvent.loading());
      },
      loading: (e) async* {
        _cartSubscription?.cancel();

        _cartSubscription = _cartRepository.watchCart().listen(
            (failureOrCart) => add(CartEvent.cartsReceived(failureOrCart)));
      },
      loaded: (e) async* {},
      add: (e) async* {
        final successOrFailure = await _cartRepository.addToCart(e.cartProduct);
        yield state.copyWith(cartFailureOrSuccessOption: successOrFailure);
      },
      remove: (e) async* {
        final successOrFailure =
            await _cartRepository.removeToCart(e.cartProduct);
        yield state.copyWith(cartFailureOrSuccessOption: successOrFailure);
      },
      clear: (e) async* {
        yield state.copyWith(cart: []);
      },
      cartsReceived: (e) async* {
        final cart =
            await (e.failureOrCart.fold((f) => <CartProduct>[], (items) async {
          final elements = items
              .map(
                (e) => _productRepository
                    .getProduct(e.productId)
                    .then(
                        (value) => value.fold((l) => Product.empty(), (r) => r))
                    .then(
                      (product) => CartProduct(
                        id: UniqueId.fromUniqueString(e.id),
                        product: product,
                        size: product.sizes.firstWhere(
                          (l) => l.sizeName.getOrCrash() == e.sizeName,
                        ),
                        quantity: e.quantity,
                      ),
                    ),
              )
              .toList();
          final list = await Future.wait<CartProduct>(elements);
          return list;
        }) as Future<List<CartProduct>>);

        yield state.copyWith(cartProducts: cart);
      },
    );
  }

  @override
  Future<void> close() {
    _cartSubscription.cancel();
    return super.close();
  }
}
