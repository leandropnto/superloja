part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    @required final Name fullName,
    @required final EmailAddress emailAddress,
    @required final Password password,
    @required final Password confirmPassword,
    @required final bool showErrorMessages,
    @required final bool isSubmitting,
    @required final bool isInputsValid,
    @required
        final Option<Either<AuthFailures, User>> authFailureOrSuccessOption,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
        fullName: Name.from(''),
        emailAddress: EmailAddress(''),
        password: Password.from(''),
        confirmPassword: Password.from(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        isInputsValid: false,
      );
}
