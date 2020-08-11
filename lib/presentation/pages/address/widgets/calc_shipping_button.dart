import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';

class CalcShippingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      elevation: 0,
      color: kPrimaryColor,
      child: const Text(
        'Calcular FRETE',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
