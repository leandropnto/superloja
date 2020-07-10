import 'package:flutter/material.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_product_info.dart';

import 'quantity_product.dart';

class CartTile extends StatelessWidget {
  final CartProduct item;

  const CartTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                item.product.images.first,
              ),
            ),
            Expanded(
              child: CartProductInfo(item: item,)
            ),
            QuantityProduct(item: item,),
          ],
        ),
      ),
    );
  }
}
