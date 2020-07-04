import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/domain/core/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
    @required Name name,
    @required EmailAddress email,
  }) = _User;
}
