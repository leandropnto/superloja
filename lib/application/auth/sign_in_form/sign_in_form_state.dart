part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required final EmailAddress emailAddress,
    @required final Password password,
    @required final bool showErrorMessages,
    @required final bool isSubmitting,
    @required
        final Option<Either<AuthFailures, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password.from(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
