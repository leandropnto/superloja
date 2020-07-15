import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/domain/user/user_failures.dart';

part 'users_event.dart';

part 'users_state.dart';

part 'users_bloc.freezed.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUserFacade _userFacade;
  StreamSubscription _usersSubscription;

  UsersBloc(this._userFacade) : assert(_userFacade != null), super(const UsersState.initial());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    yield* event.map(load: (e) async* {
      yield const UsersState.loading();
      _usersSubscription?.cancel();
      _usersSubscription = _userFacade
          .watchUsers()
          .listen((failureOrUsers) => add(UsersEvent.result(failureOrUsers)));
    }, result: (e) async* {
      yield e.failureOrUsers.fold(
        (f) => UsersState.error(f),
        (r) => UsersState.loaded(r),
      );
    });
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }
}
