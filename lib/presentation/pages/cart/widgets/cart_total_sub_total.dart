import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';

class CartTotalSubTotal extends StatelessWidget {
  const CartTotalSubTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("Subtotal:"),
              Text(
                "R\$ ${state.total.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }
    );
  }
}
