import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/presentation/core/constants.dart';

class CartFinishingOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 60,
      child: RaisedButton.icon(
        color: kPrimaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/address");
        },
        icon: const Icon(FontAwesome.shopping_bag),
        label: const Text('CONTINUAR PARA ENTREGA'),
        textColor: Colors.white,
      ),
    );
  }
}
