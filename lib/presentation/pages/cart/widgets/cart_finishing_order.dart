import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartFinishingOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8),
          height: 60,
          child: RaisedButton.icon(
            color: kPrimaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: (){},
            icon: Icon(FontAwesome.shopping_bag),
            label: const Text('GERAR PEDIDO'),
            textColor: Colors.white,
          ),
        );
      }
    );
  }
}
