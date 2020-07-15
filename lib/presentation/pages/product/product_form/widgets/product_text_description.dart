import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductTextDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
    );
    final style2 =
        TextStyle(fontWeight: FontWeight.w500, color: Colors.black87);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8.0),
      child: BlocBuilder<ProductFormBloc, ProductFormState>(
        builder: (context, state) => RichText(
          text: TextSpan(
            text: 'Descrição: \n',
            style: style,
            children: <TextSpan>[
              state.product.description.value.fold(
                (l) => TextSpan(
                    text: 'Descricão inválida',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                (r) => TextSpan(text: r, style: style2),
              ),
            ],
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
