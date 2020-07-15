part of 'product_edit_bloc.dart';

@freezed
abstract class ProductEditState implements _$ProductEditState {
  const factory ProductEditState({
    @required final UniqueId id,
    @required final List<dynamic> photos,
    @required final ProductName productName,
    @required final ProductDescription description,
    @required final List<ProductSize> sizes,
    @required final bool isSubmitting,
    @required final bool isValid,
    @required final bool showErrors,
    @required
        final Option<Either<ProductFailure, Product>>
            productFailureOrSuccessOption,
  }) = _ProductEditState;

  factory ProductEditState.initial() => ProductEditState(
        id: UniqueId.fromUniqueString(''),
        photos: [],
        productName: ProductName(''),
        description: ProductDescription(''),
        sizes: [],
        isSubmitting: false,
        showErrors: false,
        isValid: false,
        productFailureOrSuccessOption: none(),
      );

  const ProductEditState._();

  num get minPrice {
    final list = sizes
        .where((element) => element.hasStock)
        .map((element) => element.price.value.fold((l) => 0.0, (r) => r))
        .toList()
          ..sort((a, b) => a.compareTo(b));
    return list.isNotEmpty ? list.first : 0.0;
  }
}
