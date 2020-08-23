import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductTextDescription extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: kPrimaryColor,
    );
    const style2 =
        TextStyle(fontWeight: FontWeight.w500, color: Colors.black87);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8.0),
      child: Obx(
        () => RichText(
          text: TextSpan(
            text: 'Descrição: \n',
            style: style,
            children: <TextSpan>[
              bloc.product.value.description.value.fold(
                (l) => const TextSpan(
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
