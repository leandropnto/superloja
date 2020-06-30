import 'package:flutter/foundation.dart';

@immutable
abstract class ValueFailure {
  const factory ValueFailure.invalidEmail(String email) = InvalidEmail;
  const factory ValueFailure.invalidPassword(String password) = InvalidPassword;
}

class InvalidEmail implements ValueFailure {
  final String email;
  const InvalidEmail(this.email);
}

class InvalidPassword implements ValueFailure {
  final String password;
  const InvalidPassword(this.password);
}
