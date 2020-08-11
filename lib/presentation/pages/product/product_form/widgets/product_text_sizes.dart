import 'package:flutter/material.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductTextSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Tamanhos',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }
}
