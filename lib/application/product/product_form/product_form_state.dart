part of 'product_form_bloc.dart';

@freezed
abstract class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    @required Product product,
    @required ProductSize size,
    @required bool isSubmitting,
  }) = _ProductFormState;

  factory ProductFormState.initial() => ProductFormState(
        product: Product(
          id: UniqueId.fromUniqueString(''),
          sizes: [],
          images: [],
          description: ProductDescription(''),
          name: ProductName(''),
        ),
        size: ProductSize(
          sizeName: SizeName(''),
          stock: Stock(''),
          price: Price(''),
        ),
        isSubmitting: false,
      );
}
