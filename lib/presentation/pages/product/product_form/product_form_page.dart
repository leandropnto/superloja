import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/pages/home/widgets/cart_button.dart';
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
        actions: <Widget>[
          CartButton(),
        ],
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          state.cartFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    createError: (e) =>
                        "Ops... Não foi possível adicionar o produto no carrinho. Por favor, tente novamente!",
                    removeError: (e) =>
                        "Ops... Não foi possível remover o produto no carrinho. Por favor, tente novamente!",
                  ),
                ).show(context);
              },
              (r) => {
                FlushbarHelper.createSuccess(
                  title: "Super Loja",
                  message:  "Carrinho Atualizado!",
                ).show(context)
              },
            ),
          );
        },
        child: ListView(
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
      ),
    );
  }
}
