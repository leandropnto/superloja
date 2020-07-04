import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/domain/auth/auth_failures.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/injection.dart';

part 'sign_up_form_event.dart';

part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;
  final IUserFacade _userFacade;

  SignUpFormBloc(
    this._authFacade,
    this._userFacade,
  )   : assert(_authFacade != null),
        assert(_userFacade != null);

  @override
  SignUpFormState get initialState => SignUpFormState.initial();

  @override
  Stream<SignUpFormState> mapEventToState(
    SignUpFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        final emailAddress = EmailAddress(e.email);
        yield state.copyWith(
          emailAddress: emailAddress,
          authFailureOrSuccessOption: none(),
          showErrorMessages: true,
          isInputsValid: emailAddress.isValid() &&
              state.password.isValid() &&
              state.fullName.isValid(),
        );
      },
      passwordChanged: (e) async* {
        final password = Password.from(e.password);
        yield state.copyWith(
          password: password,
          authFailureOrSuccessOption: none(),
          showErrorMessages: true,
          isInputsValid: password.isValid() &&
              state.emailAddress.isValid() &&
              state.fullName.isValid(),
        );
      },
      fullNameChanged: (e) async* {
        final fullName = Name.from(e.fullName);
        yield state.copyWith(
          fullName: fullName,
          authFailureOrSuccessOption: none(),
          showErrorMessages: true,
          isInputsValid: fullName.isValid() &&
              state.password.isValid() &&
              state.emailAddress.isValid(),
        );
      },
      confirmPasswordChanged: (e) async* {
        final confirm = Password.from(e.confirmPassword);
        yield state.copyWith(
          confirmPassword: confirm,
          authFailureOrSuccessOption: none(),
          showErrorMessages: true,
          isInputsValid: confirm.isValid() &&
              state.password.isValid() &&
              state.emailAddress.isValid() &&
              state.fullName.isValid() &&
              confirm == state.password,
        );
      },
      signUpWithEmailAndPassword: (e) async* {
        yield state.copyWith(isSubmitting: true);
        final result = await _authFacade.registerWithEmailAndPassword(
            emailAddress: state.emailAddress, password: state.password);

        result.fold((l) => {}, (user) async {
          await _userFacade.createUser(
              user.copyWith(name: state.fullName, email: state.emailAddress));

          getIt<AuthBloc>().add( AuthEvent.refresh(user: user.copyWith(name: state.fullName,)));
        });



        yield state.copyWith(
            isSubmitting: false, authFailureOrSuccessOption: some(result));
      },
    );
  }
}
