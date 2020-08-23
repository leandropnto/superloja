import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartButton extends StatelessWidget {
  final bloc = CartBloc.to;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: const Icon(FontAwesome.shopping_cart),
          onPressed: () {
//            Get.toNamed("/cart");
          },
        ),
        Positioned(
          top: 0,
          right: 5,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryLightColor,
            ),
            child: Obx(
              () => Text(
                "${bloc.cartItems.length}",
                style: const TextStyle(color: kPrimaryColor, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
