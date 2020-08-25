import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/core/get_extensions.dart';

class ProductSaveButton extends StatelessWidget {
  final ProductEditBloc bloc = ProductEditBloc.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 60,
      child: RaisedButton.icon(
        disabledColor: kPrimaryLightColor,
        color: kPrimaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          if (Form.of(context).validate()) {
            Form.of(context).save();
            if (!bloc.isSubmitting.value) {
              bloc.save();
            }
          } else {
            showAppSnackBar("Verifique as informações do produto!");
          }
        },
        icon: const Icon(FontAwesome.save),
        label: bloc.isSubmitting.value
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : const Text('Salvar'),
        textColor: Colors.white,
      ),
    );
  }
}
