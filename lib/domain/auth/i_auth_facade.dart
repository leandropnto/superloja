import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';


import 'auth_failures.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailures, Unit>> signInWithGoogle();

  Future<Option<User>> getSignedInUser();
  Future<void> signOut();
}