import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductEditDescription extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductEditBloc, ProductEditState>(
      listener: (BuildContext context, ProductEditState state) {},
      buildWhen: (old, current) =>
          old.description.value != current.description.value,
      builder: (context, state) {
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
                key: state.id.value.fold((l) => const ObjectKey("desc0"),
                        (r) => ObjectKey("desc$r")) ??
                    const ObjectKey("descr1"),
                initialValue:
                    state.description.value.fold((l) => "Inválido", (r) => r) ??
                        "",
                decoration: InputDecoration(
                  hintText: 'Descrição',
                  border: InputBorder.none,
                  errorText: state.showErrors
                      ? state.description
                          .mapToErrorMessage("Informe uma descrição válida")
                      : null,
                ),
                onFieldSubmitted: (value) => context
                    .bloc<ProductEditBloc>()
                    .add(ProductEditEvent.onChangeDescription(value)),

                onSaved: (value) => context
                    .bloc<ProductEditBloc>()
                    .add(ProductEditEvent.onChangeDescription(value)),
              ),
            ],
          ),
        );
      },
    );
  }

  ProductEditDescription();
}
