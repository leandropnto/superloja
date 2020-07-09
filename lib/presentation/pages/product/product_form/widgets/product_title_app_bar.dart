import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductTitleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) => Text(
        state.product.name.value.fold(
          (f) => "Nome do produto inválido",
          (r) => r,
        ),
      ),
    );
  }
}
