import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/product_edit_text_price.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/product_name_text.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/product_save_button.dart';
import 'package:superloja/presentation/pages/product/product_edit/widgets/sizes_form.dart';
import 'widgets/images_form.dart';
import 'widgets/product_edit_description.dart';

class ProductEditPage extends StatelessWidget {
  ProductEditPage({
    Key key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<ProductEditBloc, ProductEditState>(
          listenWhen: (old, current) =>
              old.productFailureOrSuccessOption !=
              current.productFailureOrSuccessOption,
          listener: (BuildContext context, ProductEditState state) {
            state.productFailureOrSuccessOption.fold(
              () => () {},
              (either) => either.fold(
                (f) => FlushbarHelper.createError(
                    message: f.map(
                  serverError: (e) => "Erro atualizando o produto",
                  invalidProduct: (e) =>
                      "Produto Inválido. Informe todos os dados do produto.",
                )).show(context),
                (r) {
                  Navigator.of(context).pushReplacementNamed("/products");
                  FlushbarHelper.createSuccess(
                          message: "Produto atualizado com sucesso",
                          title: "Super Loja")
                      .show(context);
                },
              ),
            );
          },
          builder: (context, state) => Text(
              state.productName.value.fold((l) => "Nome inválido", (r) => r)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const ImagesForm(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const ProductNameText(),
                const ProductEditTextPrice(),
                ProductEditDescription(),
                SizesForm(),
                const ProductSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
