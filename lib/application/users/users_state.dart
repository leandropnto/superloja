part of 'users_bloc.dart';

@freezed
abstract class UsersState with _$UsersState{
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.error(UserFailures failures) = _Error;
  const factory UsersState.loaded(List<User> users) = _Loaded;
  const factory UsersState.loadedUser(User user) = _LoadedUser;
}