import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/presentation/core/widgets/custom_drawer/drawer_tile.dart';
import 'package:superloja/presentation/login/login_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerBloc, DrawerState>(
      listener: (BuildContext context, DrawerState state) {},
      builder: (BuildContext context, DrawerState state) {
        return Drawer(
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                DrawerTile(
                  iconData: Icons.home,
                  title: "Início",
                  page: 0,
                  onTap: () {
                    context.bloc<DrawerBloc>().add(DrawerEvent.homePressed());
                  },
                ),
                DrawerTile(
                  iconData: Icons.list,
                  page: 1,
                  title: "Produtos",
                  onTap: () {
                    context
                        .bloc<DrawerBloc>()
                        .add(DrawerEvent.productsPressed());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
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
              ],
            ),
          ),
        );
      },
    );
  }
}
