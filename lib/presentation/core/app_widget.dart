import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/product/product.dart';
import 'package:superloja/injection.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/auth/signin/signin_page.dart';
import 'package:superloja/presentation/pages/auth/signup/signup_page.dart';
import 'package:superloja/presentation/pages/cart/cart_page.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';
import 'package:superloja/presentation/pages/product/product_form/product_form_page.dart';
import 'package:superloja/presentation/pages/product/product_list/product_list_page.dart';
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
        BlocProvider(create: (context) => getIt<CartBloc>()),
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
//        home: SplashPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/home":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<SectionBloc>(
                  create: (_) =>
                      getIt<SectionBloc>()..add(const SectionEvent.watchAll()),
                  child: const HomePage(),
                ),
              );
            case "/signIn":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<SignInFormBloc>(
                  create: (context) => getIt<SignInFormBloc>(),
                  child: SignInPage(),
                ),
              );
            case "/signUp":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<SignInFormBloc>(
                  create: (context) => getIt<SignInFormBloc>(),
                  child: SignUpPage(),
                ),
              );
            case "/productSelectById":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<ProductFormBloc>(
                  create: (context) => getIt<ProductFormBloc>()
                    ..add(ProductFormEvent.loadingById(
                        settings.arguments as String)),
                  child: const ProductFormPage(),
                ),
              );
            case "/productByProduct":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<ProductFormBloc>(
                  create: (context) => getIt<ProductFormBloc>()
                    ..add(ProductFormEvent.loading(
                        settings.arguments as Product)),
                  child: const ProductFormPage(),
                ),
              );

            case "/products":
              return MaterialPageRoute(
                builder: (context) => BlocProvider<ProductBloc>(
                  create: (_) =>
                      getIt<ProductBloc>()..add(const ProductEvent.watchAll()),
                  child: ProductListPage(),
                ),
              );
            case "/cart":
              return MaterialPageRoute(
                builder: (context) => CartPage(),
              );
            case "/":
            case "/splash":
            default:
              return MaterialPageRoute(
                  builder: (_) => SplashPage(), settings: settings);
          }
        },
      ),
    );
  }
}
