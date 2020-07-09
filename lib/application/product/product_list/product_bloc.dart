import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_failure.dart';

part 'product_event.dart';

part 'product_state.dart';

part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository _productRepository;
  StreamSubscription<Either<ProductFailure, List<Product>>>
      _productSubscription;

  List<Product> _products = [];

  ProductBloc(this._productRepository) : assert(_productRepository != null);

  @override
  ProductState get initialState => const ProductState.initial();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield const ProductState.loadInProgress();
        _productSubscription?.cancel();
        _productSubscription = _productRepository.watchProducts().listen(
            (failureOrProducts) =>
                add(ProductEvent.productsReceived(failureOrProducts)));
      },
      productsReceived: (e) async* {
        yield e.failureOrProducts.fold((f) => const ProductState.initial(),
            (products) {
          _products = products;
          return ProductState.loadSuccess(products);
        });
      },
      productsFilterBy: (e) async* {
        if (e.filter.trim().isEmpty) {
          yield ProductState.loadSuccess(_products);
        } else {
          yield ProductState.filter(
              _products
                  .where((element) => element.name
                      .getOrCrash()
                      .toLowerCase()
                      .contains(e.filter.toLowerCase()))
                  .toList(),
              e.filter);
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _productSubscription.cancel();
    return super.close();
  }
}
