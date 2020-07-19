import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartTotalInvoice extends StatelessWidget {
  const CartTotalInvoice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'TOTAL:',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'R\$ ${(state.total + 8.9).toStringAsFixed(2)}',
                style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        );
      }
    );
  }
}
