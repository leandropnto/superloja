import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/cart/cart_bloc.dart';

class CartImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.all(16),
        child: SvgPicture.asset(
          state.isEmpty ? "assets/svg/empty_cart.svg" : "assets/svg/cart.svg",
          height: size.height * 0.3,
        ),
      ),
    );
  }
}
