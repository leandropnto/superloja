import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/input_email_widget.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/input_password_widget.dart';
import 'package:superloja/presentation/pages/auth/signin/widgets/social_button_widget.dart';

import 'widgets/background.dart';

class SignInPage extends StatelessWidget {
  final AuthBloc authController = AuthBloc.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(32),
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/svg/login_banner.svg",
                        height: size.height * 0.15,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      InputEmailWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      const InputPasswordWidget(),
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {},
                          child: const Text(
                            'esqueci minha senha',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      LoginButton(onTap: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          SystemChannels.textInput
                              .invokeMethod("TextInput.hide");
                          authController.signInWithEmailAndPassword(context);
                        }
                      }),
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
                      FlatButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/signUp"),
                        child: Text(
                          'Ou crie a sua conta',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.redAccent),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GetBuilder<AuthBloc>(
                          builder: (controller) => controller.isLoading.value
                              ? const LinearProgressIndicator()
                              : Container())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
