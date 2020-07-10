import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_failures.freezed.dart';

@freezed
abstract class CartFailures with _$CartFailures{
  const factory CartFailures.createError() = _CreateError;
  const factory CartFailures.removeError() = _RemoveError;
}