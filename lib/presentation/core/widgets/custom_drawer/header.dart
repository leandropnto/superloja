import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class Header extends StatelessWidget {
  final authBloc = AuthBloc.to;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.25),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 8),
              child: Text(
                "SUPER LOJA",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            IconButton(
              icon: const Icon(
                FontAwesome.user_circle_o,
                color: Colors.white,
                size: 45,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Obx(
              () => authBloc.firestoreUser.value.fold(
                () => const Text("Olá, Faça o Login"),
                (a) => Expanded(
                  child: Text(
                    "Bem-vindo ${a.name.getOrCrash()}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
