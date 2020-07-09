import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_add_to_cart.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_images.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_name_text.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_sizes.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_text_description.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_text_price.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/product_text_sizes.dart';
import 'package:superloja/presentation/pages/product/product_form/widgets/products_fixed_widgets.dart';

import 'widgets/product_title_app_bar.dart';

class ProductFormPage extends StatelessWidget {
  const ProductFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ProductTitleAppBar(),
      ),
      body: ListView(
        children: <Widget>[
          ProductImages(),
          ProductNameText(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ProductTextAPartirDe(),
                ProductTextPrice(),
                ProductTextDescription(),
                ProductTextSizes(),
                ProductSizes(),
                ProductAddToCart(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
