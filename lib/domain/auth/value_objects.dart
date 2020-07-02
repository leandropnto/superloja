import 'package:dartz/dartz.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory EmailAddress(String value) =>
      EmailAddress._(validateEmailAddress(value));

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory Password.from(String value) {
    return Password._(
      validateMinPassword(value).flatMap(validateMaxPassword),
    );
  }

  const Password._(this.value);
}


class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  const UserName._(this.value);

  factory UserName.from(String name) {
    return UserName._(validateName(name));
  }
}