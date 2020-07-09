part of 'product_form_bloc.dart';

@freezed
abstract class ProductFormEvent with _$ProductFormEvent{
  const factory ProductFormEvent.loading(Product product) =  _Loading;
  const factory ProductFormEvent.selectSize(ProductSize size) =  _SelecteSize;

}
