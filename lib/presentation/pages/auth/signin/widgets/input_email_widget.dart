import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/presentation/core/widgets/rounded_input_field.dart';

class InputEmailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthBloc>(
      builder: (controller) => Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: GetBuilder<AuthBloc>(
            builder: (controller) => RoundedInputField(
              controller: controller.emailController,
              onSaved: (value) => controller.emailController.text = value,
              keyboardType: TextInputType.emailAddress,
              onValidate: (value) => EmailAddress(value).isNotValid()
                  ? "Informe um email válido"
                  : null,
            ),
          )),
    );
  }
}
