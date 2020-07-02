// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:superloja/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superloja/infrastructure/auth/firebase_auth_facade.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
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
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthFacade>()));
  g.registerFactory<DrawerBloc>(() => DrawerBloc(g<IAuthFacade>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<IAuthFacade>(
      FirebaseAuthFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
}

class _$FireBaseInjectableModule extends FireBaseInjectableModule {}
