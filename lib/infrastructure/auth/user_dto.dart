import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superloja/domain/auth/user.dart';
import 'package:superloja/domain/auth/value_objects.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/infrastructure/core/server_timestamp_converter.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
abstract class UserDto implements _$UserDto {
  const factory UserDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required String email,
    bool isAdmin,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _UserDto;

  factory UserDto.fromDomain(User user) {
    return UserDto(
        id: user.id.getOrCrash(),
        name: user.name.getOrCrash(),
        email: user.email.getOrCrash(),
        isAdmin: user.isAdmin,
        serverTimeStamp: FieldValue.serverTimestamp());
  }

  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(id),
      name: Name.from(name),
      email: EmailAddress(email),
      isAdmin: isAdmin,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromFirestore(DocumentSnapshot doc) {
    return UserDto.fromJson(doc.data).copyWith(id: doc.documentID);
  }

  const UserDto._();
}
