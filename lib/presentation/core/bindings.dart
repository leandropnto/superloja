import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:superloja/application/auth/auth_bloc.dart';
import 'package:superloja/application/cart/cart_bloc.dart';
import 'package:superloja/application/drawer/drawer_bloc.dart';
import 'package:superloja/application/section/section_bloc.dart';
import 'package:superloja/domain/auth/i_auth_facade.dart';
import 'package:superloja/domain/cart/i_cart_repository.dart';
import 'package:superloja/domain/product/i_product_repository.dart';
import 'package:superloja/domain/section/i_section_repository.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/infrastructure/auth/firebase_auth_facade.dart';
import 'package:superloja/infrastructure/cart/firebase_cart_repository.dart';
import 'package:superloja/infrastructure/product/product_repository.dart';
import 'package:superloja/infrastructure/section/firebase_section_repository.dart';
import 'package:superloja/infrastructure/user/firebase_user_facade.dart';

class AppBinginds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<GoogleSignIn>(() => GoogleSignIn());
    Get.lazyPut<FirebaseStorage>(() => FirebaseStorage.instance);
    Get.lazyPut<Firestore>(() => Firestore.instance);
    Get.lazyPut<IUserFacade>(() => FirebaseUserFacade(Get.find()));
    Get.lazyPut<IAuthFacade>(() => FirebaseAuthFacade(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
    Get.lazyPut<DrawerBloc>(() => DrawerBloc(Get.find()));
    Get.lazyPut<CartBloc>(() => CartBloc(Get.find(), Get.find()));
    Get.lazyPut<ISectionRepository>(
        () => FirebaseSectionRepository(Get.find(), Get.find()));
    Get.lazyPut<IProductRepository>(
        () => ProductRepository(Get.find(), Get.find()));
    Get.put<SectionBloc>(SectionBloc(Get.find(), Get.find()));
    Get.lazyPut<ICartRepository>(() => FirebaseCartRepository(Get.find()));
    Get.put<AuthBloc>(AuthBloc(Get.find()));
  }
}
