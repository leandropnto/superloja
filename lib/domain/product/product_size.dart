import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/product/value_objects.dart';

part 'product_size.freezed.dart';

@freezed
abstract class ProductSize implements _$ProductSize {
  const factory ProductSize({
    @required SizeName sizeName,
    @required Price price,
    @required Stock stock,
  }) = _ProductSize;

  Map<String, dynamic> toMap() {
    return {
      "name": sizeName.value.fold((l) => "Nome de tamanho inválido", (r) => r),
      "price": price.getOrCrash(),
      "stock": stock.getOrCrash(),
    };
  }

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      sizeName: SizeName(map['name'] as String),
      price: Price("${map['price']}"),
      stock: Stock("${map['stock']}"),
    );
  }

  bool get hasStock => stock.value.fold((l) => false, (r) => r > 0);

  const ProductSize._();
}
