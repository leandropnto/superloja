import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/product/product_list/product_list_page.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => state.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Continue comprando os melhores produtos em nosso loja!",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Vários produtos em promoção! Confira as ofertas!",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 60,
                    child: RaisedButton.icon(
                      color: kPrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/products"),
                      icon: Icon(FontAwesome.cart_plus),
                      label: const Text('PRODUTOS'),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
