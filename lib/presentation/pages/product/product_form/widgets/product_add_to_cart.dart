import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductAddToCart extends StatelessWidget {
  final ProductFormBloc bloc = ProductFormBloc.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        height: 60,
        child: RaisedButton.icon(
          disabledColor: const Color(0xFF3b5998).withAlpha(100),
          color: kPrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: !bloc.isLoading.value && bloc.size.value.isSome()
              ? () => bloc.addToCart()
              : null,
          icon: const Icon(FontAwesome.cart_plus),
          label: bloc.isLoading.value
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : const Text('ADICIONAR AO CARRINHO'),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
