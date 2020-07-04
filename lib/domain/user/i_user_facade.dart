import 'package:dartz/dartz.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/user/user_failures.dart';


abstract class IUserFacade {
  Future<Either<UserFailures, Unit>> createUser(User user);
  Future<Either<UserFailures, User>> getUser(UniqueId uniqueId);

}
