import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';

class CartItemsCount extends StatelessWidget {
  TextStyle get style => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Quantidade de Itens:',
              style: style,
            ),
            Text(
              "${state.itemsCount}",
              style: style,
            )
          ],
        ),
      ),
    );
  }

  const CartItemsCount();
}
