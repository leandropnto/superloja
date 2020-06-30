import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

@injectable
class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  @override
  DrawerState get initialState => DrawerState.initial();

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {
    if (event is HomePressed) {
      debugPrint("HomePressed");
      yield state.copyWith(page: 0);
    } else if (event is ProductsPressed) {
      debugPrint("ProductsPressed");
      yield state.copyWith(page: 1);
    }
  }
}
