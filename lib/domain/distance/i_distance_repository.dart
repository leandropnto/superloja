abstract class IDistanceRepository {
  Future<double> calculateDistance({
    double latStore,
    double longStore,
    double lat,
    double long,
  });
}
