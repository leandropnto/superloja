import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class ProductAddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        height: 60,
        child: RaisedButton.icon(
          disabledColor: const Color(0xFF3b5998).withAlpha(100),
          color: kPrimaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
//          onPressed: !state.isSubmitting && state.size != null
//              ? () {
//                  context.bloc<CartBloc>().add(CartEvent.add(CartProduct(
//                      product: state.product,
//                      size: state.size,
//                      quantity: 1,
//                      id: UniqueId())));
//                }
//              : null,
          icon: const Icon(FontAwesome.cart_plus),
          label: state.isSubmitting
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : const Text('ADICIONAR AO CARRINHO'),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
