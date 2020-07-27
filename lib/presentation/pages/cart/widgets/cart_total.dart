import 'package:superloja/presentation/pages/cart/widgets/cart_items_count.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_invoice.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_shipping.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_sub_total.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_total_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';

import 'cart_finishing_order.dart';

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Card(
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
      ),
    );
  }
}
