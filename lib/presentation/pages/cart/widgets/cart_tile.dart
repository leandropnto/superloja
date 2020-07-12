import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/pages/cart/widgets/cart_product_info.dart';
import 'package:superloja/presentation/pages/product/product_form/product_form_page.dart';

import 'quantity_product.dart';

class CartTile extends StatelessWidget {
  final CartProduct item;

  const CartTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed("/productByProduct", arguments: item.product),
      child: Card(
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
                  child: CartProductInfo(
                item: item,
              )),
              QuantityProduct(
                item: item,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
