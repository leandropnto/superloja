part of 'drawer_bloc.dart';

@freezed
abstract class DrawerEvent with _$DrawerEvent{
  const factory DrawerEvent.homePressed() = _HomePressed;
  const factory DrawerEvent.productsPressed() = _ProductsPressed;
  const factory DrawerEvent.exitPressed() = _ExitPressed;
}

