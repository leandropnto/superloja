import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/domain/product/product_failure.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/domain/product/value_objects.dart';

part 'product_edit_event.dart';

part 'product_edit_state.dart';

part 'product_edit_bloc.freezed.dart';

@injectable
class ProductEditBloc extends Bloc<ProductEditEvent, ProductEditState> {
  final IProductRepository _productRepository;

  ProductEditBloc(this._productRepository)
      : assert(_productRepository != null),
        super(ProductEditState.initial());

  @override
  Stream<ProductEditState> mapEventToState(
    ProductEditEvent event,
  ) async* {
    yield* event.map(
      load: (e) async* {
        yield state.copyWith(
          id: e.product.id,
          productName: e.product.name,
          photos: e.product.images,
          showErrors: false,
          sizes: e.product.sizes,
          description: e.product.description,
        );
      },
      removeImage: (e) async* {
        final images =
            state.photos.where((element) => element != e.product).toList();
        yield state.copyWith(
          photos: images,
        );
      },
      addImage: (e) async* {
        final images = [...state.photos, e.file];
        yield state.copyWith(
          photos: images,
        );
      },
      save: (e) async* {
        final valid = _checkIsValid(state);
        yield state.copyWith(isSubmitting: true);
        if (valid) {
          final either = await _productRepository.save(Product(
            id: state.id,
            description: state.description,
            name: state.productName,
            sizes: state.sizes,
            images: state.photos,
          ));

          yield state.copyWith(
            productFailureOrSuccessOption: some(either),
            isSubmitting: false,
          );
        } else {
          yield state.copyWith(
            productFailureOrSuccessOption:
                some(left(const ProductFailure.invalidProduct())),
            isSubmitting: false,
          );
        }
      },
      onChangeName: (e) async* {
        final name = ProductName(e.name);
        yield state.copyWith(
          productName: name,
          showErrors: true,
        );
      },
      onChangeDescription: (e) async* {
        final description = ProductDescription(e.description);
        yield state.copyWith(
          description: description,
          showErrors: true,
        );
      },
      addSize: (e) async* {
        yield state.copyWith(sizes: [...state.sizes, ProductSize.empty()]);
      },
      removeSize: (e) async* {
        yield state.copyWith(
            sizes: state.sizes.where((element) => element != e.size).toList());
      },
      moveSize: (e) async* {
        final index = state.sizes.indexOf(e.size);
        if (index + e.movement >= 0 &&
            index + e.movement <= state.sizes.length - 1) {
          final items =
              state.sizes.where((element) => element != e.size).toList();
          items.insert(index + e.movement, e.size);
          yield state.copyWith(sizes: items);
        }
      },
      onChangeSizeTitle: (e) async* {
        final size = state.sizes.firstWhere((element) => element == e.size,
            orElse: () => ProductSize.empty());
        final index = state.sizes.indexOf(size);
        if (index >= 0) {
          final changed = size.copyWith(sizeName: SizeName(e.title));
          yield state.copyWith(
              sizes: [...state.sizes]
                ..removeAt(index)
                ..insert(index, changed));
        }

      },
      onChangeSizeStock: (e) async* {
        if (state.sizes.isEmpty || state.sizes.length == 1) {
          yield state.copyWith(sizes: [e.size]);
        } else {
          final size = state.sizes.firstWhere((element) => element == e.size,
              orElse: () => ProductSize.empty());

          final index = state.sizes.indexOf(size);
          if (index >=0) {
            final changed = size.copyWith(stock: Stock(e.stock));
            yield state.copyWith(
                sizes: [...state.sizes]
                  ..removeAt(index)
                  ..insert(index, changed));
          }

        }
      },
      onChangeSizePrice: (e) async* {
        final size = state.sizes.firstWhere((element) => element == e.size,
            orElse: () => ProductSize.empty());
        final index = state.sizes.indexOf(size);
        if (index >= 0) {
          final changed = size.copyWith(price: Price(e.price));
          yield state.copyWith(
              sizes: [...state.sizes]
                ..removeAt(index)
                ..insert(index, changed));
        }
      },
      onSaveImages: (e) async* {
        yield state.copyWith(photos: e.images);
      },
      onSaveSizes: (e) async* {
        yield state.copyWith(sizes: e.sizes);
      },
    );
  }

  bool _checkIsValid(ProductEditState state) {
    return state.photos.isNotEmpty &&
        state.productName.isValid() &&
        state.description.isValid() &&
        state.sizes.isNotEmpty &&
        state.sizes.where((size) => !size.isValid).toList().isEmpty;
  }
}
