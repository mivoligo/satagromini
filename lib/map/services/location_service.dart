import 'package:satagromini/map/models/location.dart';

abstract class LocationService {
  Future<Location> getLocation();
  Stream<Location> getLocationStream();
}
