import 'package:dartz/dartz.dart';
import 'package:superloja/domain/core/failures.dart';
import 'package:superloja/domain/core/value_objects.dart';
import 'package:superloja/domain/core/value_validators.dart';

class ProductName extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory ProductName(String value) {
    return ProductName._(
        validateMinLenght(value, 5).andThen(validateMaxLenght(value, 100)));
  }

  const ProductName._(this.value);
}

class ProductDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory ProductDescription(String value) {
    return ProductDescription._(
        validateMinLenght(value, 5).andThen(validateMaxLenght(value, 1000)));
  }

  const ProductDescription._(this.value);
}

class SizeName extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory SizeName(String name) {
    return SizeName._(
      validateMinLenght(name, 1).andThen(validateMaxLenght(name, 30)),
    );
  }

  const SizeName._(this.value);
}

class Price extends ValueObject<num> {
  @override
  final Either<ValueFailure, num> value;

  factory Price(String price) {
    return Price._(validatePrice(price));
  }

  const Price._(this.value);
}

class Stock extends ValueObject<int> {
  @override
  final Either<ValueFailure, int> value;

  factory Stock(String size) {
    return Stock._(validateStock(size));
  }

  const Stock._(this.value);
}

