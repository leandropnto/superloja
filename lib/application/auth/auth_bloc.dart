import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/infrastructure/auth/user_dto.dart';
import 'package:superloja/presentation/core/get_extensions.dart';

class AuthBloc extends GetxController {
  static AuthBloc to = Get.find();

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final IAuthFacade _auth;
  final Firestore _db = Firestore.instance;

  AuthBloc(this._auth) : assert(_auth != null);

  //AppLocalizations_Labels labels;
  //TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<FirebaseUser> firebaseUser = Rx<FirebaseUser>();
  Rx<Option<User>> firestoreUser = none<User>().obs;
  final RxBool admin = false.obs;
  final isLoading = false.obs;

  @override
  Future<void> onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(user);
    super.onInit();
  }

  @override
  void onClose() {
    //nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  Future<void> handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      await isAdmin();
    }

    if (_firebaseUser == null) {
      Get.offAllNamed("/signin");
    } else {
      Get.offAllNamed("/home");
    }
  }

  // Firebase user one-time fetch
  Future<FirebaseUser> get getUser => FirebaseAuth.instance.currentUser();

  // Firebase user a realtime stream
  Stream<FirebaseUser> get user => FirebaseAuth.instance.onAuthStateChanged;

  //Streams the firestore user from the firestore collection
  Stream<Option<User>> streamFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db
          .document('/users/${firebaseUser.value.uid}')
          .snapshots()
          .map((snapshot) => some(UserDto.fromFirestore(snapshot).toDomain()));
    }

    return null;
  }

  //get the firestore user from the firestore collection
  Future<User> getFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.document('/users/${firebaseUser.value.uid}').get().then(
          (documentSnapshot) =>
              UserDto.fromFirestore(documentSnapshot).toDomain());
    }
    return null;
  }

  //Method to handle user sign in using email and password
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    isLoading.value = true;
    update();
    try {
      final result = await _auth.signInWithEmailAndPassword(
        emailAddress: EmailAddress(emailController.text),
        password: Password.from(passwordController.text),
      );

      result.fold((l) => showAppSnackBar("Ops... nao foi possível"), (r) {
        emailController.clear();
        passwordController.clear();
      });
    } catch (error) {
      //hideLoadingIndicator();
      showAppSnackBar("Erro efetuando o login");
    }

    isLoading.value = false;
    update();
  }

  // User registration using email and password
  Future<void> registerWithEmailAndPassword(BuildContext context) async {
    //final labels = AppLocalizations.of(context);
    //showLoadingIndicator();
    isLoading.value = true;
    update();
    try {
      final email = EmailAddress(emailController.text);
      final password = Password.from(passwordController.text);

      if (email.isNotValid() || password.isNotValid()) {
        showAppSnackBar("Informe um e-mail e senha válidos");
        return;
      }

      final result = await _auth.registerWithEmailAndPassword(
          emailAddress: email, password: password);

      result.fold((l) => showAppSnackBar("Não foi possível efetuar o registro"),
          (r) => {});

      isLoading.value = false;
      update();
    } catch (error) {
      showAppSnackBar("Erro cadastrando o usuário");
    }
  }

  //handles updating the user when updating profile
  Future<void> updateUser(
      BuildContext context, User user, String oldEmail, String password) async {
//    final labels = AppLocalizations.of(context);
//    try {
//      showLoadingIndicator();
//      await _auth
//          .signInWithEmailAndPassword(email: oldEmail, password: password)
//          .then((_firebaseUser) {
//        _firebaseUser.user
//            .updateEmail(user.email)
//            .then((value) => _updateUserFirestore(user, _firebaseUser.user));
//      });
//      hideLoadingIndicator();
//      Get.snackbar(labels.auth.updateUserSuccessNoticeTitle,
//          labels.auth.updateUserSuccessNotice,
//          snackPosition: SnackPosition.BOTTOM,
//          duration: Duration(seconds: 5),
//          backgroundColor: Colors.black,
//          colorText: Colors.white);
//    } on PlatformException catch (error) {
//      //List<String> errors = error.toString().split(',');
//      // print("Error: " + errors[1]);
//      hideLoadingIndicator();
//      print(error.code);
//      String authError;
//      switch (error.code) {
//        case 'ERROR_WRONG_PASSWORD':
//          authError = labels.auth.wrongPasswordNotice;
//          break;
//        default:
//          authError = labels.auth.unknownError;
//          break;
//      }
//      Get.snackbar(labels.auth.wrongPasswordNoticeTitle, authError,
//          snackPosition: SnackPosition.BOTTOM,
//          duration: Duration(seconds: 10),
//          backgroundColor: Colors.black,
//          colorText: Colors.white);
//    }
  }

  //updates the firestore users collection
  void _updateUserFirestore(User user, FirebaseUser _firebaseUser) {
    _db
        .document('/users/${_firebaseUser.uid}')
        .setData(UserDto.fromDomain(user).toJson(), merge: true);
    //update();
  }

  //check if user is an admin user
  Future<void> isAdmin() async {
    await getUser.then((user) async {
      DocumentSnapshot adminRef =
          await _db.collection('admins').document(user?.uid).get();
      if (adminRef.exists) {
        admin.value = true;
      } else {
        admin.value = false;
      }
      update();
    });
  }

  // Sign out
  Future<void> signOut() {
    emailController.clear();
    passwordController.clear();
    return _auth.signOut();
  }
}
