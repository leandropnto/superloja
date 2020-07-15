import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesome.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed("/cart");
            },
          ),
          Positioned(
            top: 0,
            right: 5,
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryLightColor,
                ),
                child: Text(
                  "${state.length}",
                  style: TextStyle(color: kPrimaryColor, fontSize: 10),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
