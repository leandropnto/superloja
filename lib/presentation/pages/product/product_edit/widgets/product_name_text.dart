import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/value_objects.dart';

class ProductNameText extends StatelessWidget {
  final ProductName productName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: productName.value
              .fold((l) => const ObjectKey("pdn0"), (r) => ObjectKey(r)) ??
          const ObjectKey("prdNam0"),
      initialValue:
          productName.value.fold((l) => "Informe o nome", (r) => r) ?? "",
      decoration: const InputDecoration(
        hintText: 'Nome do produto',
        border: InputBorder.none,
      ),
      validator: (name) {
        return ProductName(name).mapToErrorMessage("Nome inválido");
      },
      onSaved: (value) => context
          .bloc<ProductEditBloc>()
          .add(ProductEditEvent.onChangeName(value)),
    );
  }

  const ProductNameText(this.productName);
}
