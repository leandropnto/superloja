part of 'drawer_bloc.dart';

@immutable
abstract class DrawerState {
  final int page;

  const DrawerState._(
    this.page,
  );

  factory DrawerState.initial() => const DrawerInitial._();
  DrawerState copyWith({int page});
}

class DrawerInitial extends DrawerState {
  const DrawerInitial._({int page = 0}) : super._(page);

  @override
  DrawerState copyWith({
    int page,
  }) {
    return DrawerInitial._(page: page);
  }
}
