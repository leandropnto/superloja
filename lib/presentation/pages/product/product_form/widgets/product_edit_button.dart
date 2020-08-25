import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductEditButton extends StatelessWidget {
  final AuthBloc auth = AuthBloc.to;
  final ProductEditBloc edit = ProductEditBloc.to;
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => auth.admin.value
          ? IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.toNamed("/products/edit");
                edit.load(bloc.product.value.id.getOrCrash());
              })
          : Container(),
    );
  }
}
