part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState{
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loadInProgress() = _LoadInProgress;
  const factory ProductState.loadSuccess(List<Product> products) = _LoadSuccess;
  const factory ProductState.loadFailure(ProductFailure productFailure) = _LoadFailure;
  const factory ProductState.filter(List<Product> products, String filter) = _Filter;

}
