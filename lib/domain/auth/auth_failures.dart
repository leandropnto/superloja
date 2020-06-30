import 'package:flutter/foundation.dart';

@immutable
abstract class AuthFailure {
  static const cancelledByUser = CancelledByUser._();
  static const serverError = ServerError._();
  static const emailAlreadyInUse = EmailAlreadyInUse._();
  static const invalidEmailAndPasswordCombination =
      InvalidEmailAndPasswordCombination._();
  static const userDisabled = UserDisabled._();
  static const userNotFound = UserNotFound._();
}

class CancelledByUser implements AuthFailure {
  const CancelledByUser._();
}

class ServerError implements AuthFailure {
  const ServerError._();
}

class EmailAlreadyInUse implements AuthFailure {
  const EmailAlreadyInUse._();
}

class InvalidEmailAndPasswordCombination implements AuthFailure {
  const InvalidEmailAndPasswordCombination._();
}

class UserDisabled implements AuthFailure {
  const UserDisabled._();
}

class UserNotFound implements AuthFailure {
  const UserNotFound._();
}
