import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/distance/i_distance_repository.dart';

@Singleton(as: IDistanceRepository)
class DistanceFirebase implements IDistanceRepository {
  final Firestore _firestore;

  DistanceFirebase(this._firestore) : assert(_firestore != null);

  @override
  Future<double> calculateDistance(
      {double latStore, double longStore, double lat, double long}) async {
    double dis =
        await Geolocator().distanceBetween(latStore, longStore, lat, long);
    return dis /= 1000.0;
  }
}
