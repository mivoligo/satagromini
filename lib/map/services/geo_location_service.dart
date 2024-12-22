import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/map/services/location_service.dart';

class GeoLocationService implements LocationService {
  @override
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return Location(latitude: position.latitude, longitude: position.longitude);
  }

  @override
  Stream<Location> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(),
    ).map(
      (event) => Location(latitude: event.latitude, longitude: event.longitude),
    );
  }

  @override
  Future<bool> isLocationTurnedOn() async {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> isPermissionGranted() async {
    final currentPermission = await Geolocator.checkPermission();
    return currentPermission == LocationPermission.always ||
        currentPermission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> requestPermission() async {
    await Geolocator.requestPermission();
    final permission = await isPermissionGranted();
    return permission;
  }
}
