import 'package:dartz/dartz.dart';
import 'package:superloja/domain/core/failures.dart';

Either<ValueFailure, String> validateCep(String input) {
  const cepRegex = r"\d{8}";
  if (RegExp(cepRegex).hasMatch(input.replaceAll(RegExp(r'\D'), ""))) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidCep(input),
    );
  }
}
