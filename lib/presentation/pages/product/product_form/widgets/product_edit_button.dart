import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductEditButton extends StatelessWidget {
  final AuthBloc bloc = AuthBloc.to;
  final ProductFormBloc productBloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => bloc.admin.value
          ? IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.put(ProductFormBloc(Get.find()));
                Get.toNamed("/product/edit");
                productBloc.load(productBloc.product.value.id.getOrCrash());
              })
          : Container(),
    );
  }
}
