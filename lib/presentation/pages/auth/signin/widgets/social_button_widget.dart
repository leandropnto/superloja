import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoginButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      buildWhen: (old, current) =>
          old.isInputsValid != current.isInputsValid ||
          old.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Container(
          height: 60,
          child: RaisedButton.icon(
            disabledColor: const Color(0xFF3b5998).withAlpha(100),
            color: const Color(0xFF3b5998),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: state.isInputsValid && !state.isSubmitting
                ? () => context.bloc<SignInFormBloc>().add(
                    const SignInFormEvent.signInWithEmailAndPasswordPressed())
                : null,
            icon: Icon(FontAwesome.sign_in),
            label: state.isSubmitting ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ): const Text('ACESSAR'),
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}

class FacebookButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const FacebookButtonWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton.icon(
        color: const Color(0xFF3b5998),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onTap,
        icon: Icon(FontAwesome.facebook),
        label: const Text('facebook'),
        textColor: Colors.white,
      ),
    );
  }
}

class GoogleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleButtonWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton.icon(
        color: Colors.red,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onTap,
        icon: Icon(FontAwesome.google),
        label: const Text('Google'),
        textColor: Colors.white,
      ),
    );
  }
}
