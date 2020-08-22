import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/distance/i_distance_repository.dart';
import 'package:superloja/domain/distance/i_shippment_service.dart';
import 'package:superloja/domain/distance/shipment_failures.dart';

@Singleton(as: IShippmentService)
class ShipmentService implements IShippmentService {
  final Firestore _firestore;
  final IDistanceRepository _distanceRepository;
  final String _folder = "aux/delivery";

  @override
  Future<num> get maxKM async =>
      (await _firestore.document(_folder).get()).data['maxkm'] as num;

  @override
  Future<double> get storeLat async =>
      (await _firestore.document(_folder).get()).data['latitude'] as double;

  @override
  Future<double> get storeLong async =>
      (await _firestore.document(_folder).get()).data['longitude'] as double;

  @override
  Future<num> get basePrice async =>
      (await _firestore.document(_folder).get()).data['base'] as num;

  @override
  Future<double> get taxes async =>
      (await _firestore.document(_folder).get()).data['km'] as double;

  ShipmentService(this._firestore, this._distanceRepository)
      : assert(_firestore != null),
        assert(_distanceRepository != null);

  @override
  Future<Either<ShipmentFailures, double>> totalCust(
      double lat, double long) async {
    try {
      return await Future.wait([maxKM, storeLat, storeLong, basePrice, taxes])
          .then((value) async {
        final distance = (await _distanceRepository.calculateDistance(
                latStore: value[1] as double,
                longStore: value[2] as double,
                lat: lat,
                long: long)) /
            1000.0;

        final base = value[3] + 0.0;
        final taxKM = value[4] as double;

        return distance > value[0]
            ? left(const ShipmentFailures.outOfRange())
            : right((base as double) + distance * taxKM);
      });
    } catch (e) {
      return left(const ShipmentFailures.errorOnCalc());
    }
  }
}
