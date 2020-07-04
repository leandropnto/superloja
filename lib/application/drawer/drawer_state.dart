part of 'drawer_bloc.dart';

@freezed
abstract class DrawerState with _$DrawerState {

  factory DrawerState.initial({@required int page}) = _Initial;

}

