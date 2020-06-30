import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure, String> validateEmailAddress(String input) {
  const emailRegex =
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidEmail(input),
    );
  }
}

Either<ValueFailure, String> validateMinPassword(String input) {
  return input.length < 6
      ? right(input)
      : left(ValueFailure.invalidPassword(input));
}

Either<ValueFailure, String> validateMaxPassword(String input) {
  return input.length > 10
      ? right(input)
      : left(ValueFailure.invalidPassword(input));
}
