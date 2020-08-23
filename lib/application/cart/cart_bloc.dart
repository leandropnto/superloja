import 'package:get/get.dart';
import 'package:superloja/domain/cart/cart_item.dart';
import 'package:superloja/domain/cart/i_cart_repository.dart';
import 'package:superloja/domain/product/i_product_repository.dart';

class CartBloc extends GetxController {
  final ICartRepository _cartRepository;
  final IProductRepository _productRepository;

  CartBloc(
    this._cartRepository,
    this._productRepository,
  ) : assert(_cartRepository != null);

  static CartBloc to = Get.find();
  RxList<CartItem> cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    //here we tell todos to stream from the load todos method.
    cartItems.bindStream(loadItems());
  }

  Stream<Iterable<CartItem>> loadItems() {
    return _cartRepository.watchCart();
  }
//  @override
//  Stream<CartState> mapEventToState(
//    CartEvent event,
//  ) async* {
//    yield* event.map(
//      initial: (e) async* {
//        add(const CartEvent.loading());
//      },
//      loading: (e) async* {
//        _cartSubscription?.cancel();
//
//        _cartSubscription = _cartRepository.watchCart().listen(
//            (failureOrCart) => add(CartEvent.cartsReceived(failureOrCart)));
//      },
//      loaded: (e) async* {},
//      add: (e) async* {
//        final successOrFailure = await _cartRepository.addToCart(e.cartProduct);
//        yield state.copyWith(cartFailureOrSuccessOption: successOrFailure);
//      },
//      remove: (e) async* {
//        final successOrFailure =
//            await _cartRepository.removeToCart(e.cartProduct);
//        yield state.copyWith(cartFailureOrSuccessOption: successOrFailure);
//      },
//      clear: (e) async* {
//        yield state.copyWith(cart: []);
//      },
//      cartsReceived: (e) async* {
//        final cart =
//            await (e.failureOrCart.fold((f) => <CartProduct>[], (items) async {
//          final elements = items
//              .map(
//                (e) => _productRepository
//                    .getProduct(e.productId)
//                    .then(
//                        (value) => value.fold((l) => Product.empty(), (r) => r))
//                    .then(
//                      (product) => CartProduct(
//                        id: UniqueId.fromUniqueString(e.id),
//                        product: product,
//                        size: product.sizes.firstWhere(
//                          (l) => l.sizeName.getOrCrash() == e.sizeName,
//                        ),
//                        quantity: e.quantity,
//                      ),
//                    ),
//              )
//              .toList();
//          final list = await Future.wait<CartProduct>(elements);
//          return list;
//        }) as Future<List<CartProduct>>);
//
//        yield state.copyWith(cartProducts: cart);
//      },
//      setAddress: (e) async* {
//        yield state.copyWith(address: some(e.address));
//      },
//    );
//  }
//
//  @override
//  Future<void> close() {
//    _cartSubscription.cancel();
//    return super.close();
//  }
}
