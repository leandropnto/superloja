import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/domain/product/product.dart';

class ProductNewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => state.maybeMap(
          authenticated: (e) => e.user.isAdmin
              ? IconButton(
                  icon: Icon(FontAwesome.plus_circle),
                  onPressed: () => Navigator.of(context).pushNamed(
                    "/product/edit",
                    arguments: Product.empty(),
                  ),
                )
              : Container(),
          orElse: () => Container()),
    );
  }
}
