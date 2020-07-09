import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductTextPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) => Text(
        'R\$ ${state.size.price.value.fold((l) => "Selecione", (r) => r.toStringAsFixed(2))}',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
