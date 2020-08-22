import 'package:dartz/dartz.dart';
import 'package:superloja/domain/distance/shipment_failures.dart';

abstract class IShippmentService {
  Future<num> get maxKM;
  Future<double> get storeLat;
  Future<double> get storeLong;
  Future<num> get basePrice;
  Future<double> get taxes;

  Future<Either<ShipmentFailures, double>> totalCust(double lat, double long);
}
