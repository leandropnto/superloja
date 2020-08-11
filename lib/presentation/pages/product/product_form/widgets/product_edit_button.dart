import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';

class ProductEditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => state.maybeMap(
            authenticated: (e) => e.user.isAdmin
                ? IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => Navigator.of(context).pushNamed(
                      "/product/edit",
                      arguments: context.bloc<ProductFormBloc>().state.product,
                    ),
                  )
                : Container(),
            orElse: () => Container()));
  }
}
