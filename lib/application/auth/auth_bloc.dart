import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/injection.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : assert(_authFacade != null);

  @override
  AuthState get initialState => const AuthState.initial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthState.unauthenticated(),
          (user) {
            getIt<CartBloc>().add(const CartEvent.loading());
            return AuthState.authenticated(user);
          },
        );
      },
      signedOut: (e) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
      refresh: (Refresh e) async* {
        yield AuthState.authenticated(e.user);
      },
    );
  }
}
