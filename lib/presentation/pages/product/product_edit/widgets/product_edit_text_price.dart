import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductEditTextPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductEditBloc, ProductEditState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('A partir de', style: TextStyle(color: Colors.grey[600], fontSize: 13),),
          Text(
            'R\$ ${state.minPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  const ProductEditTextPrice();
}
