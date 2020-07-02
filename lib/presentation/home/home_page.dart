import 'package:superloja/presentation/core/widgets/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Loja'),
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}
