import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/presentation/core/widgets/rounded_input_field.dart';

class InputPasswordWidget extends StatelessWidget {
  final TextEditingController controller;

  const InputPasswordWidget({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: GetBuilder<AuthBloc>(
        builder: (bloc) => RoundedInputField(
          obscure: true,
          controller: controller,
          icon: const Icon(FontAwesome.lock),
          keyboardType: TextInputType.text,
          onSaved: (value) => bloc.passwordController.text = value,
          onValidate: (value) => Password.from(value).isNotValid()
              ? "Informe uma senha válida"
              : null,
        ),
      ),
    );
  }
}
