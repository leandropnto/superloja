import 'package:flutter/material.dart';

class CartTotalShipping extends StatelessWidget {
  const CartTotalShipping({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text("Quantidade de Itens:"),
          Text(
            "R\$ 8,90",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
