import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/drawer_tile.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/header.dart';
import 'package:superloja/presentation/pages/auth/signin/signin_page.dart';
import 'package:superloja/presentation/pages/auth/signup/signup_page.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';
import 'package:superloja/presentation/pages/product/product_list/product_list_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerBloc, DrawerState>(
      listener: (BuildContext context, DrawerState state) {
        if (state.page == 9) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SignInPage()));
        }
      },
      builder: (BuildContext context, DrawerState state) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Header(),
              DrawerTile(
                iconData: Icons.home,
                title: "Início",
                page: 0,
                navigate: () => const HomePage(),
              ),
              DrawerTile(
                iconData: Icons.list,
                page: 1,
                title: "Produtos",
                navigateReplace: () => BlocProvider<ProductBloc>(
                  create: (_) =>
                      getIt<ProductBloc>()..add(const ProductEvent.watchAll()),
                  child: ProductListPage(),
                ),
              ),
              DrawerTile(
                iconData: Icons.playlist_add_check,
                page: 2,
                title: "Meus Pedidos",
              ),
              DrawerTile(
                iconData: Icons.location_on,
                page: 3,
                title: "Lojas",
              ),
              DrawerTile(
                iconData: Icons.location_on,
                page: 4,
                title: "Cadastrar Usuário",
                navigate: () => SignUpPage(),
              ),
              DrawerTile(
                  iconData: Icons.exit_to_app,
                  page: 9,
                  title: "Sair",
                  navigateReplace: () {
                    context
                        .bloc<DrawerBloc>()
                        .add(const DrawerEvent.exitPressed());

                    context.bloc<CartBloc>().add(const CartEvent.clear());
                    return SignInPage();
                  }),
            ],
          ),
        );
      },
    );
  }
}
