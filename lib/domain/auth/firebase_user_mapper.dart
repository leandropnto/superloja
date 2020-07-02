
import 'package:firebase_auth/firebase_auth.dart';
import 'package:superloja/domain/core/value_objects.dart';

import 'user.dart';
import 'value_objects.dart';

extension FirebaseUserMapperX on FirebaseUser {
  User toDomain() => User(
        id: UniqueId.fromUniqueString(uid),
        name: UserName.from(displayName ?? ''),
      );
}
