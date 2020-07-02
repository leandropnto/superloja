import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';

class InputEmailWidget extends StatelessWidget {

  const InputEmailWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      condition: (oldState, currentState) {
        return oldState.emailAddress != currentState.emailAddress;
      },
      builder: (BuildContext context, SignInFormState state) {
        return Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextField(
            enabled: !state.isSubmitting,
            autocorrect: false,
            onChanged: (value) =>
                context.bloc<SignInFormBloc>().add(
                    SignInFormEvent.emailChanged(value)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
                errorText: state.showErrorMessages
                    ? state.emailAddress.mapToErrorMessage(
                    "Informe um email válido!")
                    : null,
                hintText: 'E-mail'),
          ),
        );
      },
    );
  }
}
