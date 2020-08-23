import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductSizes extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: bloc.product.value.sizes
            .map((s) => ProductSizeWidget(size: s))
            .toList(),
      ),
    );
  }
}

class ProductSizeWidget extends StatelessWidget {
  final ProductSize size;

  ProductSizeWidget({Key key, this.size}) : super(key: key);

  final ProductFormBloc bloc = ProductFormBloc.to;

  Color _getColor(ProductSize size, Option<ProductSize> selected) {
    if (!size.hasStock) {
      return kPrimaryLightColor;
    } else {
      return selected.fold(() => Colors.grey[500],
          (a) => size == a ? kPrimaryColor : Colors.grey[500]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (size.hasStock) {
          bloc.size.value = some(size);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getColor(size, bloc.size.value)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: _getColor(size, bloc.size.value),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                size.sizeName.value.fold((l) => "Nome inválido", (r) => r),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                size.price.value.fold((l) => 'Preço inválido',
                    (r) => "R\$ ${r.toStringAsFixed(2)}"),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
