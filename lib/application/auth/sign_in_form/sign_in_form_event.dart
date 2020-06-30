part of 'sign_in_form_bloc.dart';

@immutable
abstract class SignInFormEvent {
  const SignInFormEvent._();
  factory SignInFormEvent.passwordChanged(String password) =>
      PasswordChanged._(password: password);

  factory SignInFormEvent.emailChanged(String email) =>
      EmailChanged._(email: email);

  R map<R>([
    R Function(EmailChanged) emailChanged,
    R Function(PasswordChanged) passwordChanged,
  ]) {
    if (this is EmailChanged) {
      return emailChanged(this as EmailChanged);
    } else if (this is PasswordChanged) {
      return passwordChanged(this as PasswordChanged);
    }

    throw Error();
  }
}

class PasswordChanged extends SignInFormEvent {
  final String password;
  const PasswordChanged._({
    this.password,
  }) : super._();
}

class EmailChanged extends SignInFormEvent {
  final String email;
  const EmailChanged._({
    this.email,
  }) : super._();
}
