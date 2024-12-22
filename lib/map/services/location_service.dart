import 'package:satagromini/map/models/location.dart';

abstract class LocationService {
  Future<Location> getLocation();
  Stream<Location> getLocationStream();
  Future<bool> isLocationTurnedOn();
  Future<bool> isPermissionGranted();
  Future<bool> requestPermission();
}
