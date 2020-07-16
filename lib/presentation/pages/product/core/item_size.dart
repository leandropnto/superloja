import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/domain/product/value_objects.dart';

class ItemSize {
  String title;
  num stock;
  num price;

  ItemSize({this.title, this.stock, this.price});

  ProductSize toSize() {
    return ProductSize(
      sizeName: SizeName(title),
      price: Price("$price"),
      stock: Stock("$stock"),
    );
  }

  factory ItemSize.from(ProductSize size) {
    return ItemSize(
      title: size.sizeName.value.fold((l) => "", (r) => r),
      price: size.price.value.fold((l) => 0, (r) => r),
      stock: size.stock.value.fold((l) => 0, (r) => r),
    );
  }
}
