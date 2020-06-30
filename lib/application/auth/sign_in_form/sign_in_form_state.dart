part of 'sign_in_form_bloc.dart';

@immutable
abstract class SignInFormState {
  @required
  final EmailAddress emailAddress;
  @required
  final Password password;
  @required
  final bool showErrorMessages;
  @required
  final bool isSubmitting;
  @required
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  const SignInFormState({
    this.emailAddress,
    this.password,
    this.showErrorMessages,
    this.isSubmitting,
    this.authFailureOrSuccessOption,
  });

  factory SignInFormState.initital() => SignInFormInitial._();
}

class SignInFormInitial extends SignInFormState {
  SignInFormInitial._()
      : super(
          emailAddress: EmailAddress(''),
          password: Password.from(''),
          showErrorMessages: false,
          isSubmitting: false,
          authFailureOrSuccessOption: none(),
        );
}
