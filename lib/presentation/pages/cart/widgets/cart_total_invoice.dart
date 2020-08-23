import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartTotalInvoice extends StatelessWidget {
  const CartTotalInvoice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text(
            'TOTAL:',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "R\$ 90,0",
            //'R\$ ${(state.total + 8.9).toStringAsFixed(2)}',
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
