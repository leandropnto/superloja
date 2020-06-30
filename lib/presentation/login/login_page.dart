import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/presentation/login/widgets/input_email_widget.dart';
import 'package:superloja/presentation/login/widgets/input_password_widget.dart';
import 'package:superloja/presentation/login/widgets/social_button_widget.dart';

import 'widgets/background.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32),
          children: <Widget>[
            SvgPicture.asset(
              "assets/svg/login_banner.svg",
              height: size.height * 0.25,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 32,
            ),
            const InputEmailWidget(),
            const SizedBox(
              height: 16,
            ),
            const InputPasswordWidget(),
            const SizedBox(
              height: 8,
            ),
            LoginButton(
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FacebookButtonWidget(
                    onTap: () => {},
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: GoogleButtonWidget(
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Ou crie a sua conta',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
