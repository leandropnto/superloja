import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:superloja/presentation/core/bindings.dart';
import 'package:superloja/presentation/core/constants.dart';
import 'package:superloja/presentation/pages/auth/signin/signin_page.dart';
import 'package:superloja/presentation/pages/home/home_page.dart';
import 'package:superloja/presentation/pages/product/product_edit/product_edit_page.dart';
import 'package:superloja/presentation/pages/product/product_form/product_form_page.dart';
import 'package:superloja/presentation/pages/product/product_list/product_list_page.dart';
import 'package:superloja/presentation/pages/splash/splash_page.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
        initialBinding: AppBinginds(),
        debugShowCheckedModeBanner: false,
        title: 'Super Loja',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          fontFamily: 'RobotoCondensed',
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        home: SplashPage(),
        getPages: [
          GetPage(name: '/home', page: () => HomePage()),
          GetPage(name: '/signin', page: () => SignInPage()),
          GetPage(name: '/products', page: () => ProductListPage()),
          GetPage(name: '/products/edit', page: () => ProductEditPage()),
          GetPage(
              name: '/productByProduct', page: () => const ProductFormPage()),
        ]),
  );
}
