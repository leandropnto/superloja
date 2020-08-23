import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      child: SvgPicture.asset(
        false ? "assets/svg/empty_cart.svg" : "assets/svg/cart.svg",
        height: size.height * 0.3,
      ),
    );
  }
}
