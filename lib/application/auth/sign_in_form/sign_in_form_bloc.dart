import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/auth/auth_failures.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : assert(_authFacade != null);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        final emailAddress = EmailAddress(e.email);
        yield state.copyWith(
            emailAddress: emailAddress,
            authFailureOrSuccessOption: none(),
            showErrorMessages: true,
            isInputsValid: emailAddress.isValid() && state.password.isValid());
      },
      passwordChanged: (e) async* {
        final password = Password.from(e.password);
        yield state.copyWith(
          password: password,
          authFailureOrSuccessOption: none(),
          showErrorMessages: true,
          isInputsValid: password.isValid() && state.emailAddress.isValid(),
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final result = await _authFacade.signInWithEmailAndPassword(
            emailAddress: state.emailAddress, password: state.password);

        yield state.copyWith(
            isSubmitting: false, authFailureOrSuccessOption: some(result));
      },
    );
  }
}
