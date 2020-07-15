import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/domain/product/value_objects.dart';

part 'product_form_event.dart';

part 'product_form_state.dart';

part 'product_form_bloc.freezed.dart';

@injectable
class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final IProductRepository _productRepository;

  ProductFormBloc(this._productRepository) : assert(_productRepository != null), super(ProductFormState.initial());

  @override
  Stream<ProductFormState> mapEventToState(
    ProductFormEvent event,
  ) async* {
    yield* event.map(
      loading: (e) async* {
        yield state.copyWith(size: e.product.minPrice, product: e.product);
      },
      selectSize: (e) async* {
        yield state.copyWith(size: e.size);
      },
      loadingById: (e) async* {
        final product = await _productRepository.getProduct(e.product);
        yield product.fold(
            (l) => state, (r) => state.copyWith(size: r.minPrice, product: r));
      },
    );
  }
}
