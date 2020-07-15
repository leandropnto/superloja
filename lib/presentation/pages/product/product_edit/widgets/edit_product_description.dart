import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/value_objects.dart';

class EditProductDescription extends StatelessWidget {
  final ProductDescription description;
  final bool showErrors;

  const EditProductDescription({Key key, this.description, this.showErrors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: description.value
              .fold((l) => const ObjectKey("0"), (r) => ObjectKey(r)) ??
          const ObjectKey("prodDesc0"),
      initialValue: description.value.fold((l) => "Inválido", (r) => r) ?? "",

      decoration: InputDecoration(
        hintText: 'Descrição',
        border: InputBorder.none,
        errorText: showErrors
            ? description.mapToErrorMessage("Informe uma descrição válida")
            : null,
      ),
      onFieldSubmitted: (value) => context
          .bloc<ProductEditBloc>()
          .add(ProductEditEvent.onChangeDescription(value)),
    );
  }
}
