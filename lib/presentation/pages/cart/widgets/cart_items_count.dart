import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartItemsCount extends StatelessWidget {
  TextStyle get style => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Quantidade de Itens:',
            style: style,
          ),
          Text(
            "000",
            //"${state.itemsCount}",
            style: style,
          )
        ],
      ),
    );
  }

  const CartItemsCount();
}
