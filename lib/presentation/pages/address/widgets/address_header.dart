import 'package:flutter/material.dart';

class AddressHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      height: size.height * 0.35,
      child: Image.asset("assets/images/deliveries.png"),
    );
  }
}
