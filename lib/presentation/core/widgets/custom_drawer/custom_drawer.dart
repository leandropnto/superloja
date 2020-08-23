import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/drawer_tile.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/header.dart';

class CustomDrawer extends StatelessWidget {
  final authBloc = AuthBloc.to;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  onTap: () => Get.toNamed("/home"),
                ),
                DrawerTile(
                  iconData: FontAwesome.archive,
                  page: 1,
                  title: "Produtos",
                  onTap: () => Get.toNamed("/products"),
                ),
                const DrawerTile(
                  iconData: FontAwesome.cart_plus,
                  page: 2,
                  title: "Meus Pedidos",
                ),
                const DrawerTile(
                  iconData: Icons.location_on,
                  page: 3,
                  title: "Lojas",
                ),
                if (authBloc.admin.value)
                  Column(
                    children: <Widget>[
                      DrawerTile(
                        iconData: Icons.supervised_user_circle,
                        page: 4,
                        title: "Usuários",
                        onTap: () => Navigator.of(context).pushNamed("/users"),
                      ),
                      DrawerTile(
                        iconData: FontAwesome.shopping_bag,
                        page: 4,
                        title: "Gerenciar Pedidos",
                        onTap: () => Navigator.of(context).pushNamed("/home"),
                      ),
                    ],
                  ),
                DrawerTile(
                  iconData: Icons.exit_to_app,
                  page: 9,
                  title: "Sair",
                  onTap: () => authBloc.signOut(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
