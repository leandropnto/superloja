import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:superloja/presentation/core/widgets/rounded_input_field.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      condition: (old, current) => old.fullName != current.fullName,
      builder: (context, state) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: RoundedInputField(
          hintText: "Nome",
          onChanged: (value) => context
              .bloc<SignUpFormBloc>()
              .add(SignUpFormEvent.fullNameChanged(value)),
          errorText: state.showErrorMessages
              ? state.fullName.mapToErrorMessage("Informe o nome válido")
              : null,
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      condition: (old, current) => old.emailAddress != current.emailAddress,
      builder: (context, state) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: RoundedInputField(
          onChanged: (value) => context
              .bloc<SignUpFormBloc>()
              .add(SignUpFormEvent.emailChanged(value)),
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          hintText: "Informe o email",
          errorText: state.showErrorMessages
              ? state.emailAddress.mapToErrorMessage("Informe um email válido")
              : null,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      condition: (old, current) => old.password != current.password,
      builder: (context, state) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: RoundedInputField(
          obscure: true,
          icon: FontAwesome.lock,
          autocorrect: false,
          hintText: "Informe a senha",
          onChanged: (value) => context.bloc<SignUpFormBloc>().add(SignUpFormEvent.passwordChanged(value)),
          errorText: state.showErrorMessages
              ? state.password.mapToErrorMessage("Informe uma senha válida")
              : null,
        ),
      ),
    );
  }
}

class ConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      condition: (old, current) =>
          old.confirmPassword != current.confirmPassword,
      builder: (context, state) => Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: RoundedInputField(
          obscure: true,
          hintText: "confirme a seu senha",
          icon: FontAwesome.lock,
          onChanged: (value) => context.bloc<SignUpFormBloc>().add(SignUpFormEvent.confirmPasswordChanged(value)),
          errorText: state.showErrorMessages
              ? state.confirmPassword.mapToErrorMessage("Confirmação inválida")
              : null,
        ),
      ),
    );
  }
}
