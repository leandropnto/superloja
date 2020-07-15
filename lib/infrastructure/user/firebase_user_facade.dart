import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/user/i_user_facade.dart';
import 'package:superloja/domain/user/user_failures.dart';
import 'package:superloja/infrastructure/auth/user_dto.dart';

@Singleton(as: IUserFacade)
class FirebaseUserFacade implements IUserFacade {
  final Firestore _firestore;

  FirebaseUserFacade(this._firestore) : assert(_firestore != null);

  @override
  Future<Either<UserFailures, Unit>> createUser(User user) async {
    final uid = user.id.getOrCrash();
    final userDocument = _firestore.collection("users").document(uid);
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
    final documentUser =
        await _firestore.collection("users").document(uid).get();

    final documentAdmin =
        await _firestore.collection("admins").document(uid).get();

    try {
      final userDto = UserDto.fromFirestore(documentUser)
          .copyWith(id: documentUser.documentID, isAdmin: documentAdmin.exists);
      return right(userDto.toDomain());
    } catch (e) {
      return left(const UserFailures.createUserError());
    }
  }

  @override
  Stream<Either<UserFailures, List<User>>> watchUsers() async* {
    yield* _firestore.collection("users").snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map((doc) => UserDto.fromFirestore(doc).copyWith(isAdmin: true).toDomain())
                .toList(),
          ),
        );
  }
}
