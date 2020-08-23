import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/auth/auth_failures.dart';
import 'package:superloja/domain/auth/firebase_user_mapper.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/infrastructure/auth/user_dto.dart';

@Singleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final IUserFacade _userFacade;
  final Firestore _firestore;

  FirebaseAuthFacade(
      this._firebaseAuth, this._googleSignIn, this._userFacade, this._firestore)
      : assert(_firebaseAuth != null),
        assert(_googleSignIn != null),
        assert(_userFacade != null),
        assert(_firestore != null);

  @override
  Future<Option<User>> getSignedInUser() async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final user = await _userFacade
          .getUser(UniqueId.fromUniqueString(firebaseUser.uid));
      return user.fold((l) => none(), (r) => some(r));
    }
    return optionOf(firebaseUser?.toDomain());
  }

  @override
  Future<Either<AuthFailures, User>> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getOrCrash();
    final pswd = password.getOrCrash();
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: pswd);
      final user = User(
        id: UniqueId.fromUniqueString(authResult.user.uid),
        email: EmailAddress(authResult.user.email),
        name: Name.from('Informe o nome'),
        isAdmin: false,
      );
      return right(user);
    } on PlatformException catch (e) {
      return (e.code == 'ERROR_EMAIL_ALREADY_IN_USE')
          ? left(const AuthFailures.emailAlreadyInUse())
          : left(const AuthFailures.serverError());
    }
  }

  @override
  Future<Either<AuthFailures, User>> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getOrCrash();
    final pswd = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pswd);
      final firebaseUser = await _firebaseAuth.currentUser();
      final document =
          await _firestore.collection("users").document(firebaseUser.uid).get();
      final admin = await _firestore
          .collection("admins")
          .document(firebaseUser.uid)
          .get();
      final user = UserDto.fromFirestore(document)
          .copyWith(isAdmin: admin.exists)
          .toDomain();
      return right(user);
    } on PlatformException catch (e) {
      return (e.code == 'ERROR_USER_NOT_FOUND' ||
              e.code == 'ERROR_WRONG_PASSWORD')
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
