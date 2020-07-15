import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';

class ProductNameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductEditBloc, ProductEditState>(
      buildWhen: (old, current) => old.productName != current.productName,
      builder: (context, state) => TextFormField(
        key: state.id.value.fold(
                (l) => const ObjectKey("pdn0"), (r) => ObjectKey("pdn$r")) ??
            const ObjectKey("prdNam0"),
        initialValue:
            state.productName.value.fold((l) => "Nome inválido", (r) => r) ?? "",
        decoration: InputDecoration(
          hintText: 'Nome do produto',
          border: InputBorder.none,
          errorText: state.showErrors && !state.isSubmitting
              ? state.productName.mapToErrorMessage("Informe um nome válido")
              : null,
        ),
        onFieldSubmitted: (value)   => context
        .bloc<ProductEditBloc>()
        .add(ProductEditEvent.onChangeName(value)),
      ),
    );
  }

  const ProductNameText();
}
