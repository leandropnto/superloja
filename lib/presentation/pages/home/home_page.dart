import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:superloja/presentation/pages/home/widgets/cart_button.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Loja'),
        actions: <Widget>[
          CartButton(),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
