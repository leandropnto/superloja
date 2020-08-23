import 'dart:async';

import 'package:get/get.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';

class ProductBloc extends GetxController {
  final IProductRepository _productRepository;

  ProductBloc(this._productRepository) : assert(_productRepository != null);

  static ProductBloc to = Get.find();

  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;
  RxString filter = "Produtos".obs;

  @override
  void onInit() {
    isLoading.value = true;
    products.bindStream(loadProducts());
    isLoading.value = false;
  }

  Stream<Iterable<Product>> loadProducts() {
    return _productRepository.watchProducts();
  }

  void filterBy(String search) {
    if (search.isEmpty || search == "Produtos") {
      products.bindStream(loadProducts());
    } else {
      isLoading.value = true;
      products.value = products.value
          .where(
            (element) => element.name
                .getOrCrash()
                .toLowerCase()
                .contains(search.toLowerCase()),
          )
          .toList();
      isLoading.value = false;
    }
    filter.value = search;
  }

//  @override
//  Stream<ProductState> mapEventToState(
//    ProductEvent event,
//  ) async* {
//    yield* event.map(
//      watchAll: (e) async* {
//        yield const ProductState.loadInProgress();
//        _productSubscription?.cancel();
//        _productSubscription = _productRepository.watchProducts().listen(
//            (failureOrProducts) =>
//                add(ProductEvent.productsReceived(failureOrProducts)));
//      },
//      productsReceived: (e) async* {
//        yield e.failureOrProducts.fold((f) => const ProductState.initial(),
//            (products) {
//          _products = products;
//          return ProductState.loadSuccess(products);
//        });
//      },
//      productsFilterBy: (e) async* {
//        if (e.filter.trim().isEmpty) {
//          yield ProductState.loadSuccess(_products);
//        } else {
//          yield ProductState.filter(
//              _products
//                  .where((element) => element.name
//                      .getOrCrash()
//                      .toLowerCase()
//                      .contains(e.filter.toLowerCase()))
//                  .toList(),
//              e.filter);
//        }
//      },
//    );
//  }
//
//  @override
//  Future<void> close() async {
//    await _productSubscription.cancel();
//    return super.close();
//  }
}
