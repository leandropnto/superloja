import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/presentation/core/constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Container(
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
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Text(
                  "SUPER LOJA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
              IconButton(
                icon: Icon(
                  FontAwesome.user_circle_o,
                  color: Colors.white,
                  size: 45,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              Text(
                "Ola, ${state.map(
                  initial: (_) => "Faça o Login",
                  authenticated: (state) =>
                      state.user.name.value.fold((l) => "", (r) => r),
                  unauthenticated: (_) => "Faça o login",
                )}",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
