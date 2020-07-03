import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SvgPicture.asset(
        "assets/svg/create_user.svg",
        height: size.height * 0.2,
        fit: BoxFit.contain,
      ),
    );
  }
}
