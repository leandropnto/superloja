import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure with _$ValueFailure{
  const factory ValueFailure.invalidEmail(String email) = _InvalidEmail;
  const factory ValueFailure.invalidPassword(String password) = _InvalidPassword;
  const factory ValueFailure.shortName(String name) = _ShortName;
  const factory ValueFailure.shortInput(String name) = _ShortInput;
  const factory ValueFailure.largeInput(String name) = _LargeInput;
  const factory ValueFailure.fullName(String name) = _FullName;
  const factory ValueFailure.invalidNumber(String number) = _InvalidNumber;
  const factory ValueFailure.invalidPositivNumber(String number) = _InvalidPositivNumber;
  const factory ValueFailure.invalidCep(String number) = _InvalidCep;
}

