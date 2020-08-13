import 'package:dartz/dartz.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/core/value_validators.dart';

class AddressNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory AddressNumber(String number) {
    return AddressNumber._(
        validateMinLenght(number, 1).flatMap((a) => validateMaxLenght(a, 30)));
  }

  const AddressNumber._(this.value);
}

class AddressComplement extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory AddressComplement(String complement) {
    return AddressComplement._(validateMaxLenght(complement, 100));
  }

  const AddressComplement._(this.value);
}
