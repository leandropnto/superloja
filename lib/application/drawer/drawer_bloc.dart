import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';

part 'drawer_event.dart';

part 'drawer_state.dart';

part 'drawer_bloc.freezed.dart';

@injectable
class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {

  final IAuthFacade _authFacade;

  DrawerBloc(this._authFacade) : assert(_authFacade != null);

  @override
  DrawerState get initialState => DrawerState.initial(page: 0);

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {
    yield* event.map(
        homePressed: (_) async* {
          yield state.copyWith(page: 0);
        },
        productsPressed: (_) async* {},
        exitPressed: (_) async* {
          await _authFacade.signOut();
          yield state.copyWith(page: 9);
        });
  }
}
