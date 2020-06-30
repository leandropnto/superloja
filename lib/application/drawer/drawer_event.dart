part of 'drawer_bloc.dart';

@immutable
abstract class DrawerEvent {
  const DrawerEvent._();

  factory DrawerEvent.homePressed() => const HomePressed._();
  factory DrawerEvent.productsPressed() => const ProductsPressed._();
}

class HomePressed extends DrawerEvent {
  const HomePressed._() : super._();
}

class ProductsPressed extends DrawerEvent {
  const ProductsPressed._() : super._();
}
