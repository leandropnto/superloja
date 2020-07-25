import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/address/widgets/address_card.dart';
import 'package:superloja/presentation/pages/address/widgets/address_header.dart';


class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: const Text('Endereço'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => ListView(
          children: <Widget>[
            AddressHeader(),
            AddreessCard(),
          ],
        ),
      ),
    );
  }
}
