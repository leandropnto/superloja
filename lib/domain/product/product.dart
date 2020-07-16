import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/product/value_objects.dart';

import 'product_size.dart';

part 'product.freezed.dart';

@freezed
abstract class Product implements _$Product {
  const factory Product({
    @required UniqueId id,
    @required ProductName name,
    @required ProductDescription description,
    @required List<dynamic> images,
    @required List<ProductSize> sizes,
  }) = _Product;

  factory Product.empty() {
    return Product(
        id: UniqueId(),
        name: ProductName('Novo Produto'),
        description: ProductDescription('Informe a descrição'),
        images: [],
        sizes: []);
  }

  ProductSize get minPrice {
    final orderedSizes = sizes.where((element) => element.hasStock).toList()
      ..sort((a, b) => a.price.value.fold((l) => 0, (r) => r.toInt()) -
          a.price.value.fold((l) => 0, (r) => r.toInt()) as int);
    return orderedSizes.isNotEmpty
        ? orderedSizes.first
        : ProductSize(
            sizeName: SizeName('Inválildo'),
            price: Price("-1"),
            stock: Stock("-1"),
          );
  }

  bool get hasSizes => sizes.isNotEmpty;

  const Product._();
}
