import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superloja/domain/auth/auth_failures.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/domain/auth/firebase_user_mapper.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn)
      : assert(_firebaseAuth != null),
        assert(_googleSignIn != null);

  @override
  Future<Option<User>> getSignedInUser() async {
    final firebaseUser = await _firebaseAuth.currentUser();
    return optionOf(firebaseUser?.toDomain());
  }

  @override
  Future<Either<AuthFailures, Unit>> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getOrCrash();
    final pswd = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pswd);
      return right(unit);
    } on PlatformException catch (e) {
      return (e.code == 'ERROR_EMAIL_ALREADY_IN_USE')
          ? left(const AuthFailures.emailAlreadyInUse())
          : left(const AuthFailures.serverError());
    }
  }

  @override
  Future<Either<AuthFailures, Unit>> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getOrCrash();
    final pswd = password.getOrCrash();
    try {
      _firebaseAuth.signInWithEmailAndPassword(email: email, password: pswd);
      return right(unit);
    } on PlatformException catch (e) {
      return (e.code == 'ERROR_USER_NOT_FOUND' ||
              e.code == 'ERROR_USER_NOT_FOUND')
          ? left(const AuthFailures.invalidEmailAndPasswordCombination())
          : left(const AuthFailures.serverError());
    }
  }

  @override
  Future<Either<AuthFailures, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailures.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.getCredential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);

      return await _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on PlatformException catch (_) {
      return left(const AuthFailures.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}
