import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:superloja/presentation/core/widgets/rounded_input_field.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
        condition: (old, current) => old.password != current.password,
        builder: (context, state) {
          return Container(
            alignment: Alignment.bottomLeft,
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: RoundedInputField(
              enabled: !state.isSubmitting,
              obscure: true,
              icon: FontAwesome.lock,
              onChanged: (value) => context
                  .bloc<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(value)),
              keyboardType: TextInputType.text,
              errorText: state.showErrorMessages
                  ? state.password
                      .mapToErrorMessage("Informe uma senha válida!")
                  : null,
            ),
          );
        });
  }
}
