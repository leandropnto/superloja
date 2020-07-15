import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_edit/product_edit_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductSaveButton extends StatelessWidget {

  const ProductSaveButton();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductEditBloc, ProductEditState>(
      builder: (context, state) =>  Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
      height: 60,
      child: RaisedButton.icon(
        disabledColor: kPrimaryLightColor,
        color: kPrimaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: !state.isSubmitting
            ? () =>
            context.bloc<ProductEditBloc>().add(
                const ProductEditEvent.save())
            : null,
        icon: Icon(FontAwesome.save),
        label: state.isSubmitting ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ) : const Text('Salvar'),
        textColor: Colors.white,
      ),
    ), );
  }
}
