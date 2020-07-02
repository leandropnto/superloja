import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure with _$ValueFailure{
  const factory ValueFailure.invalidEmail(String email) = _InvalidEmail;
  const factory ValueFailure.invalidPassword(String password) = _InvalidPassword;
  const factory ValueFailure.shortName(String name) = _ShortName;
}

