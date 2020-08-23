import 'package:flutter/material.dart';

class CartTotalSubTotal extends StatelessWidget {
  const CartTotalSubTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text("Subtotal:"),
          Text(
            "100",
//                "R\$ ${state.total.toStringAsFixed(2)}",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
