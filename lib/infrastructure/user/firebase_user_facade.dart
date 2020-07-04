import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/domain/user/user_failures.dart';
import 'package:superloja/infrastructure/auth/user_dto.dart';
import 'package:superloja/infrastructure/core/firebase_helpers.dart';

@Singleton(as: IUserFacade)
class FirebaseUserFacade implements IUserFacade {
  final Firestore _firestore;

  FirebaseUserFacade(this._firestore) : assert(_firestore != null);

  @override
  Future<Either<UserFailures, Unit>> createUser(User user) async {
    final uid = user.id.getOrCrash();
    final userDocument =  _firestore.collection("users").document(uid);
    try {
      await userDocument.setData(UserDto.fromDomain(user).toJson());
      return right(unit);
    } catch (e) {
      return left(const UserFailures.createUserError());
    }
  }

  @override
  Future<Either<UserFailures, User>> getUser(UniqueId uniqueId) async {
    final uid = uniqueId.getOrCrash();
    final documentSnapshot =
        await _firestore.collection("users").document(uid).get();

    try {
      final userDto = UserDto.fromFirestore(documentSnapshot)
          .copyWith(id: documentSnapshot.documentID);
      return right(userDto.toDomain());
    } catch (e) {
      return left(const UserFailures.createUserError());
    }
  }
}
