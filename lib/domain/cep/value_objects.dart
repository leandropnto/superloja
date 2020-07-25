import 'package:dartz/dartz.dart';
import 'package:superloja/domain/cep/value_validators.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/core/value_objects.dart';

class Cep extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory Cep(String cepStr) {
    return Cep._(validateCep(cepStr));
  }

  String cleanValue() {
    return value.fold((l) => "", (r) => r.replaceAll(RegExp(r'\D'), ""));
  }

  const Cep._(this.value);
}
