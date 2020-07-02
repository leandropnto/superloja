// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superloja/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final fireBaseInjectableModule = _$FireBaseInjectableModule();
  g.registerFactory<DrawerBloc>(() => DrawerBloc());
  g.registerLazySingleton<FirebaseAuth>(
      () => fireBaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => fireBaseInjectableModule.firestore);
  g.registerLazySingleton<GoogleSignIn>(
      () => fireBaseInjectableModule.googleSignIn);
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc());
}

class _$FireBaseInjectableModule extends FireBaseInjectableModule {}
