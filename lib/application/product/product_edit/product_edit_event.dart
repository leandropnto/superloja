part of 'product_edit_bloc.dart';

@freezed
abstract class ProductEditEvent with _$ProductEditEvent{
  const factory ProductEditEvent.load(Product product) = _Load;
  const factory ProductEditEvent.removeImage(dynamic product) = _RemoveImage;
  const factory ProductEditEvent.addImage(File file) = _AddImage;
  const factory ProductEditEvent.save() = _Save;
  const factory ProductEditEvent.addSize() = _AddSize;
  const factory ProductEditEvent.removeSize(ProductSize size) = _RemoveSize;
  const factory ProductEditEvent.moveSize(ProductSize size, int movement) = _MoveSize;
  const factory ProductEditEvent.onChangeName(String name) = _OnChangeName;
  const factory ProductEditEvent.onChangeDescription(String description) = _OnChangeDescription;
  const factory ProductEditEvent.onChangeSizeTitle(ProductSize size, String title) = _OnChangeSizeTitle;
  const factory ProductEditEvent.onChangeSizeStock(ProductSize size, String stock) = _OnChangeSizeStock;
  const factory ProductEditEvent.onChangeSizePrice(ProductSize size, String price) = _OnChangeSizePrice;

}