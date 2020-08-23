import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/product_list_app_title.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/product_new_button.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/search_button.dart';

import 'widgets/products_widget.dart';

class ProductListPage extends StatelessWidget {
  final ProductBloc bloc = ProductBloc.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: ProductListAppTitle(),
        actions: <Widget>[
          SearchButton(),
          ProductNewButton(),
        ],
      ),
      body: Obx(() {
        if (bloc.isLoading.value) {
          return const CircularProgressIndicator();
        } else {
          return ProductsWidget(
            products: bloc.products.value,
          );
        }
      }),
    );
  }
}
