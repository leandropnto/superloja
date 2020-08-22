import 'package:dartz/dartz.dart';
import 'package:superloja/domain/cep/value_validators.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/core/value_validators.dart';

class Cep extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory Cep(String cepStr) {
    return Cep._(
      validateMinLenght(cepStr, 1).flatMap(validateCep),
    );
  }

  String cleanValue() {
    return value.fold((l) => "", (r) => r.replaceAll(RegExp(r'\D'), ""));
  }

  const Cep._(this.value);
}

class AddressNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory AddressNumber(String number) {
    return AddressNumber._(validateMinLenght(number, 1));
  }

  const AddressNumber._(this.value);
}

class AddressComplement extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory AddressComplement(String complement) {
    return AddressComplement._(validateMinLenght(complement, 0));
  }

  const AddressComplement._(this.value);
}
