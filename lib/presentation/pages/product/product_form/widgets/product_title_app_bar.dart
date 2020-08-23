import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductTitleAppBar extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
          bloc.product.value.name.value.fold((l) => "Carregando...", (r) => r)),
    );
  }
}
