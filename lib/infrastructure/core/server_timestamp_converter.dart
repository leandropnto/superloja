import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object value) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(Object fieldValue) => fieldValue;
}