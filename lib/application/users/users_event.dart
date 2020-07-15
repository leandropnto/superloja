part of 'users_bloc.dart';

@freezed
abstract class UsersEvent with _$UsersEvent{
  const factory UsersEvent.load() = _Load;
  const factory UsersEvent.result(Either<UserFailures, List<User>> failureOrUsers) = _Result;

}
