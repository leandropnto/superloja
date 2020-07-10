import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_image.dart';

import 'widgets/cart_tile.dart';
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => ListView(
          children: <Widget>[
            CartImage(),
            EmptyCart(),
            ...state.cartProducts.map((e) => CartTile(item: e,)),
          ],
        ),
      ),
    );
  }
}
