import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure, String> validateEmailAddress(String input) {
  const emailRegex =
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidEmail(input),
    );
  }
}

Either<ValueFailure, String> validateMinPassword(String input) {
  return input.length >= 6
      ? right(input)
      : left(ValueFailure.invalidPassword(input));
}

Either<ValueFailure, String> validateMaxPassword(String input) {
  return input.length <= 10
      ? right(input)
      : left(ValueFailure.invalidPassword(input));
}

Either<ValueFailure, String> validateName(String input) {
  const nameRegex = r"""[\w{2}+]\s[\w{2+}]""";
  if (RegExp(nameRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.shortName(input),
    );
  }
}

Either<ValueFailure, String> validateMinLenght(String input, int minLenght) {
  return input.length >= minLenght
      ? right(input)
      : left(ValueFailure.shortInput(input));
}

Either<ValueFailure, String> validateMaxLenght(String input, int maxLenght) {
  return input.length <= maxLenght
      ? right(input)
      : left(ValueFailure.largeInput(input));
}

Either<ValueFailure, String> validateFullName(String input) {
  const nameRegex = r"""[\w{2}+]\s[\w{2+}]""";
  if (RegExp(nameRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.fullName(input),
    );
  }
}

Either<ValueFailure, num> validatePrice(String input) {
  String valor = "0";
  try {
    if (input.indexOf(",") > 0) {
      valor =
          input.replaceAll(".", "#").replaceAll("#", "").replaceAll(",", ".");
    } else {
      valor = input;
    }
    final val = num.parse(valor);
    final price = val > 100 ? val / 100 : val;
    if (price <= 0.0) {
      return left(ValueFailure.invalidNumber(input));
    }
    return right(price);
  } on FormatException {
    return left(ValueFailure.invalidNumber(input));
  }
}

Either<ValueFailure, int> validateStock(String input) {
  try {
    final size = int.parse(input);
    if (size < 0) {
      return left(ValueFailure.invalidPositivNumber(input));
    }

    return right(size);
  } on FormatException {
    return left(ValueFailure.invalidNumber(input));
  }
}
