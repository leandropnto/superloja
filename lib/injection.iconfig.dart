// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:superloja/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superloja/infrastructure/product/product_repository.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/infrastructure/user/firebase_user_facade.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/application/product/product_list/product_bloc.dart';
import 'package:superloja/application/product/product_form/product_form_bloc.dart';
import 'package:superloja/infrastructure/auth/firebase_auth_facade.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:superloja/application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final fireBaseInjectableModule = _$FireBaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => fireBaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => fireBaseInjectableModule.firestore);
  g.registerLazySingleton<GoogleSignIn>(
      () => fireBaseInjectableModule.googleSignIn);
  g.registerFactory<ProductBloc>(() => ProductBloc(g<IProductRepository>()));
  g.registerFactory<ProductFormBloc>(() => ProductFormBloc());
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<SignUpFormBloc>(
      () => SignUpFormBloc(g<IAuthFacade>(), g<IUserFacade>()));
  g.registerFactory<DrawerBloc>(() => DrawerBloc(g<IAuthFacade>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<IProductRepository>(ProductRepository(g<Firestore>()));
  g.registerSingleton<IUserFacade>(FirebaseUserFacade(g<Firestore>()));
  g.registerSingleton<IAuthFacade>(FirebaseAuthFacade(
    g<FirebaseAuth>(),
    g<GoogleSignIn>(),
    g<IUserFacade>(),
  ));
  g.registerSingleton<AuthBloc>(AuthBloc(g<IAuthFacade>()));
}

class _$FireBaseInjectableModule extends FireBaseInjectableModule {}
