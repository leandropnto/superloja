part of 'sign_up_form_bloc.dart';

@freezed
abstract class SignUpFormEvent with _$SignUpFormEvent{
  const factory SignUpFormEvent.fullNameChanged(String fullName) = _FullNameChanged;
  const factory SignUpFormEvent.emailChanged(String email) = _EmailChanged;
  const factory SignUpFormEvent.passwordChanged(String password) = _PasswordChanged;
  const factory SignUpFormEvent.confirmPasswordChanged(String confirmPassword) = _ConfirmPasswordChanged;
  const factory SignUpFormEvent.signUpWithEmailAndPassword() = _SignUpWithEmailAndPassword;
}
