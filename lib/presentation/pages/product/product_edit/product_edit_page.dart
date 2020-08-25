import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final ProductEditBloc bloc = ProductEditBloc.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(bloc.product.value.name.value
              .fold((l) => "Nome inválido", (r) => r)),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            ImagesForm(
              key: ObjectKey(bloc.photos),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ProductNameText(),
                  ProductEditTextPrice(),
                  ProductEditDescription(bloc.product.value.description),
                  SizesForm(),
                  ProductSaveButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
