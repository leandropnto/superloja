import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductNameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );

    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) => Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.all(16),
        child: Text(
          state.product.name.value.fold(
            (l) => 'Nome do produto inválido',
            (r) => r,
          ),
          style: style,
        ),
      ),
    );
  }
}
