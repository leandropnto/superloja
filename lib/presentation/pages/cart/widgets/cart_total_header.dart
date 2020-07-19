import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartTotalHeader extends StatelessWidget {
  const CartTotalHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      color: kPrimaryColor,
      child: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Text(
          'Resumo do Pedido',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
