import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/domain/product/product.dart';

class ProductNewButton extends StatelessWidget {
  final AuthBloc authBloc = AuthBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authBloc.admin.value
          ? IconButton(
              icon: const Icon(FontAwesome.plus_circle),
              onPressed: () =>
                  Get.toNamed("/product/edit", arguments: Product.empty()),
            )
          : Container(),
    );
  }
}
