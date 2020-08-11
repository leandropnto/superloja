import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) => Container(
        height: 60,
        child: RaisedButton.icon(
            disabledColor: kPrimaryLightColor,
            color: kPrimaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: state.isInputsValid || !state.isSubmitting
                ? () => context
                    .bloc<SignUpFormBloc>()
                    .add(const SignUpFormEvent.signUpWithEmailAndPassword())
                : null,
            textColor: Colors.white,
            icon: const Icon(FontAwesome.save),
            label: state.isSubmitting
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    'CADASTRAR',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  )),
      ),
    );
  }
}
