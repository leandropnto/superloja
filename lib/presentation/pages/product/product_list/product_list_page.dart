import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/application/product/product_list/products_widget.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/product_list_app_title.dart';
import 'package:superloja/presentation/pages/product/product_list/widgets/search_button.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: ProductListAppTitle(),
        actions: <Widget>[
          SearchButton(),
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) => {},
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => const CircularProgressIndicator(),
              loadSuccess: (e) => ProductsWidget(
                products: e.products,
              ),
              loadFailure: (e) => const Center(
                child: Text('Ops...ocorreu um erro'),
              ),
              filter: (e) => ProductsWidget(
                products: e.products,
              ),
            );
          }),
    );
  }
}
