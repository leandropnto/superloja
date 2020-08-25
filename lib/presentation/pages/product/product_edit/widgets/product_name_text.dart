import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/value_objects.dart';

class ProductNameText extends StatelessWidget {
  final ProductEditBloc bloc = ProductEditBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        key: bloc.product.value.name.value
                .fold((l) => const ObjectKey("pdn0"), (r) => ObjectKey(r)) ??
            const ObjectKey("prdNam0"),
        initialValue: bloc.product.value.name.value
                .fold((l) => "Informe o nome", (r) => r) ??
            "",
        decoration: const InputDecoration(
          hintText: 'Nome do produto',
          border: InputBorder.none,
        ),
        validator: (name) {
          return ProductName(name).mapToErrorMessage("Nome inválido");
        },
        onSaved: (value) => bloc.product.value =
            bloc.product.value.copyWith(name: ProductName(value)),
      ),
    );
  }
}
