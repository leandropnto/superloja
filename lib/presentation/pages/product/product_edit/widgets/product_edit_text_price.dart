import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductEditTextPrice extends StatelessWidget {
  final ProductEditBloc bloc = ProductEditBloc.to;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'A partir de',
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
        Obx(
          () => Text(
            'R\$ ${bloc.minPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
