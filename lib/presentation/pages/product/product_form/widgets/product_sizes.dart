import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/domain/product/product_size.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
        builder: (context, state) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children:
            state.product.sizes.map((s) => ProductSizeWidget(size: s)).toList(),
      );
    });
  }
}

class ProductSizeWidget extends StatelessWidget {
  final ProductSize size;

  const ProductSizeWidget({Key key, this.size}) : super(key: key);

  Color _getColor(ProductSize size, ProductSize selected) {
    if (!size.hasStock) {
      return kPrimaryLightColor;
    } else {
      if (size == selected) {
        return kPrimaryColor;
      } else {
        return Colors.grey[500];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (old, current) => old.size != current.size,
      builder: (context, state) => GestureDetector(
        onTap: () {
          if (size.hasStock) {
            context
                .bloc<ProductFormBloc>()
                .add(ProductFormEvent.selectSize(size));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: _getColor(size, state.size)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: _getColor(size, state.size),
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
      ),
    );
  }
}
