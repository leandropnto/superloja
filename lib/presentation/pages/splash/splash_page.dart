import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/presentation/pages/splash/widgets/background.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/login_banner.svg",
              height: size.height * 0.3,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Bem Vindo a",
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center),
            Text(
              "SUPER LOJA",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
