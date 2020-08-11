import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/domain/product/value_objects.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductEditDescription extends StatelessWidget {
  final ProductDescription description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Descrição',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor),
          ),
          TextFormField(
            key: description.value.fold((l) => const ObjectKey("desc0"),
                    (r) => ObjectKey("desc$r")) ??
                const ObjectKey("descr1"),
            initialValue: description.value
                    .fold((l) => "Informe a descrição do produto", (r) => r) ??
                "",
            decoration: const InputDecoration(
              hintText: 'Descrição',
              border: InputBorder.none,
            ),
            validator: (desc) => ProductDescription(desc)
                .mapToErrorMessage("Descrição inválida"),
            onSaved: (value) => context
                .bloc<ProductEditBloc>()
                .add(ProductEditEvent.onChangeDescription(value)),
          ),
        ],
      ),
    );
  }

  const ProductEditDescription(this.description);
}
