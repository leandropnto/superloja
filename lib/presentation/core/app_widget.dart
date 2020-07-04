import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DrawerBloc>()),
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super Loja',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
        ),
        home: SplashPage(),
      ),
    );
  }
}
