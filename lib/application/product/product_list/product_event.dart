part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.watchAll() = _WatchAll;

  const factory ProductEvent.productsReceived(
          Either<ProductFailure, List<Product>> failureOrProducts) =
      _ProductsReceived;

  const factory ProductEvent.productsFilterBy(String filter) =
      _ProductsFilterBy;
}
