import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/background.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/create_button.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/inputs_widget.dart';
import 'package:superloja/presentation/pages/auth/signup/widgets/logo_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Background(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            LogoWidget(),
            NameInput(),
            EmailInput(),
            PasswordInput(),
            ConfirmationInput(),
            CreateButton(),
          ],
        ),
      ),
    );
  }
}
