import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductNameText extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );

    return Container(
      color: kPrimaryColor,
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Text(
          bloc.product.value.name.value.fold(
            (l) => 'Nome do produto inválido',
            (r) => r,
          ),
          style: style,
        ),
      ),
    );
  }
}
