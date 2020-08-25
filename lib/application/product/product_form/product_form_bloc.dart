import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/presentation/core/get_extensions.dart';

class ProductFormBloc extends GetxController {
  final IProductRepository _productRepository;

  ProductFormBloc(this._productRepository) : assert(_productRepository != null);

  static ProductFormBloc to = Get.find();

  Rx<Product> product = Product.empty().obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  Rx<Option<ProductSize>> size = none<ProductSize>().obs;

  Future<void> load(String id) async {
    debugPrint("Carregando $id");
    isLoading.value = true;
    final result = await _productRepository.getProduct(id);
    result.fold(
      (failure) {
        isLoading.value = false;
        isError.value = true;
      },
      (loadedProduct) {
        product.value = loadedProduct;
        isLoading.value = false;
        isError.value = false;
        size.value = some(loadedProduct.sizes.first);
      },
    );
  }

  Future<void> addToCart() {
    isLoading.value = true;
    if (size.value.isNone()) {
      showAppSnackBar("Selecione o tamanho desejado.");
    } else {
      final selectedSize = size.value.fold(() => ProductSize.empty(), (a) => a);
      Get.find<CartBloc>().add(CartProduct(
          id: UniqueId(),
          product: product.value,
          quantity: 1,
          size: selectedSize));
    }
  }
//  @override
//  Stream<ProductFormState> mapEventToState(
//    ProductFormEvent event,
//  ) async* {
//    yield* event.map(
//      loading: (e) async* {
//        yield state.copyWith(size: e.product.minPrice, product: e.product);
//      },
//      selectSize: (e) async* {
//        yield state.copyWith(size: e.size);
//      },
//      loadingById: (e) async* {
//        final product = await _productRepository.getProduct(e.product);
//        yield product.fold(
//            (l) => state, (r) => state.copyWith(size: r.minPrice, product: r));
//      },
//    );
//  }
}
