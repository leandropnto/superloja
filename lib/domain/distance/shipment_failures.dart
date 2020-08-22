import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_failures.freezed.dart';

@freezed
abstract class ShipmentFailures with _$ShipmentFailures {
  const factory ShipmentFailures.outOfRange() = _OutOfRange;
  const factory ShipmentFailures.errorOnCalc() = _ErrorOnCalc;
}
