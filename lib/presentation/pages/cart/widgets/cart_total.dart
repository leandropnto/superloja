import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_items_count.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_header.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_invoice.dart';

import 'cart_finishing_order.dart';

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const CartTotalHeader(),
//            const CartTotalSubTotal(),
//            const Divider(),
//            const CartTotalShipping(),
          const CartItemsCount(),
          const SizedBox(
            height: 12,
          ),
          const Divider(),
          const CartTotalInvoice(),
          CartFinishingOrder(),
        ],
      ),
    );
  }
}
