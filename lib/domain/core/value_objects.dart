import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  bool isValid() => value.isRight();
  bool isNotValid() => value.isLeft();

  Either<ValueFailure, Unit> get failureOrUnit =>
      value.fold((f) => left(f), (r) => right(unit));

  Either<ValueFailure, T> get value;

  T getOrCrash() {
    //id -> Identity function : equivalente a retornar (r) => r
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  String mapToErrorMessage(String errorText) =>
      value.isLeft() ? errorText : null;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(right(uniqueId));
  }

  const UniqueId._(this.value);

  @override
  final Either<ValueFailure, String> value;
}
