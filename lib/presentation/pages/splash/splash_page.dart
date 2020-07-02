import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';
import 'package:superloja/presentation/pages/auth/signin/signin_page.dart';
import 'package:superloja/presentation/pages/splash/widgets/background.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) => {
          state.map(
            initial: (_) {},
            authenticated: (u) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage())),
            unauthenticated: (_) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInPage())),

          )
        },
        builder: (context, state) => Background(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SvgPicture.asset(
                "assets/svg/login_banner.svg",
                height: size.height * 0.3,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20,),
              Text("Bem Vindo à",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center),
              Text(
                "SUPER LOJA",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
