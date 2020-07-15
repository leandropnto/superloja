import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/drawer_tile.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<DrawerBloc, DrawerState>(
      listener: (BuildContext context, DrawerState state) {
        if (state.page == 9) {
          Navigator.of(context).pushReplacementNamed("/signIn");
        }
      },
      builder: (BuildContext context, DrawerState state) {
        return Drawer(
          child: Container(
            color: Colors.grey[200],
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Opacity(
                    opacity: .8,
                    child: SvgPicture.asset("assets/svg/window_shopping.svg",
                        height: size.height * 0.25),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Header(),
                    DrawerTile(
                      iconData: Icons.home,
                      title: "Início",
                      page: 0,
                      onTap: () => Navigator.of(context).pushNamed("/home"),
                    ),
                    DrawerTile(
                      iconData: FontAwesome.archive,
                      page: 1,
                      title: "Produtos",
                      onTap: () => Navigator.of(context).pushNamed("/products"),
                    ),
                    DrawerTile(
                      iconData: FontAwesome.cart_plus,
                      page: 2,
                      title: "Meus Pedidos",
                    ),
                    DrawerTile(
                      iconData: Icons.location_on,
                      page: 3,
                      title: "Lojas",
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) => state.maybeMap(
                          authenticated: (e) => e.user.isAdmin
                              ? Column(
                                  children: <Widget>[
                                    DrawerTile(
                                      iconData: Icons.supervised_user_circle,
                                      page: 4,
                                      title: "Usuários",
                                      onTap: () => Navigator.of(context)
                                          .pushNamed("/users"),
                                    ),
                                    DrawerTile(
                                      iconData: FontAwesome.shopping_bag,
                                      page: 4,
                                      title: "Gerenciar Pedidos",
                                      onTap: () => Navigator.of(context)
                                          .pushNamed("/home"),
                                    ),
                                  ],
                                )
                              : Container(),
                          orElse: () => Container()),
                    ),
                    DrawerTile(
                        iconData: Icons.exit_to_app,
                        page: 9,
                        title: "Sair",
                        onTap: () {
                          context
                              .bloc<DrawerBloc>()
                              .add(const DrawerEvent.exitPressed());

                          context.bloc<CartBloc>().add(const CartEvent.clear());
                          Navigator.of(context).pushNamed("/signIn");
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
