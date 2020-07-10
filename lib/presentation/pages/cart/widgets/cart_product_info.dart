import 'package:flutter/material.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartProductInfo extends StatelessWidget {
  final CartProduct item;

  const CartProductInfo({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            item.product.name.value.fold((l) => "Nome Inválido", (r) => r),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: kPrimaryColor,
            ),
          ),
          Text(
            item.size.sizeName.value.fold((l) => "Tamanho inválido", (r) => "Tamanho: $r"),
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            item.size.price.value.fold((l) => "Preço inválido", (r) => "R\$: ${r.toStringAsFixed(2)}"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
