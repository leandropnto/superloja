import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductTextPrice extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        'R\$ ${bloc.size.value.fold(() => "Selecione", (a) => a.price.value.fold((l) => "Selecione", (r) => r.toStringAsFixed(2)))}',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
