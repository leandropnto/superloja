import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/auth/auth_failures.dart';
import 'package:superloja/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
            emailAddress: EmailAddress(e.email),
            authFailureOrSuccessOption: none(),
            showErrorMessages: true);
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
            password: Password.from(e.password),
            authFailureOrSuccessOption: none(),
            showErrorMessages: true);
      },
      signInWithEmailAndPasswordPressed: (e) async* {

      },
    );
  }
}
