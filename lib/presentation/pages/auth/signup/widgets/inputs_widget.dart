import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const TextField(
        decoration: InputDecoration(
          labelText: "Nome",
          hintText: "Informe o nome completo",
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Informe o email",
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const TextField(
        maxLength: 10,
        obscureText: true,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Senha",
          hintText: "Informe a senha",
        ),
      ),
    );
  }
}

class ConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const TextField(
        obscureText: true,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Confirmação",
          hintText: "confirme a seu senha",
        ),
      ),
    );
  }
}