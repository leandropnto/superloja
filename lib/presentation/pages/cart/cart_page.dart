import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_image.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total.dart';

import 'widgets/empty_cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: const Text('Meu carrinho'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          CartImage(),
          EmptyCart(),
//            ...state.cartProducts.map((e) => CartTile(item: e,)),
          CartTotal(),
        ],
      ),
    );
  }
}
