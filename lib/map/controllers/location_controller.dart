import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/map/models/location_permission_status.dart';
import 'package:satagromini/map/services/geo_location_service.dart';
import 'package:satagromini/map/services/location_service.dart';

part 'location_controller.g.dart';

@riverpod
MapController mapController(Ref ref) => MapController();

@riverpod
LocationService locationService(Ref ref) => GeoLocationService();

@riverpod
Stream<Location> locationStream(Ref ref) {
  return ref.watch(locationServiceProvider).getLocationStream();
}

@riverpod
Stream<Location> firstValidLocation(Ref ref) {
  return ref.watch(locationServiceProvider).getLocationStream().take(1);
}

@riverpod
class LocationPermissionsState extends _$LocationPermissionsState {
  @override
  Future<LocationPermissionStatus> build() async {
    final locationService = ref.watch(locationServiceProvider);
    final isLocationTurnedOn = await locationService.isLocationTurnedOn();
    final isPermissionGranted = await locationService.isPermissionGranted();
    return LocationPermissionStatus(
      isLocationTurnedOn: isLocationTurnedOn,
      isPermissionGranted: isPermissionGranted,
    );
  }

  Future<void> requestPermissions() async {
    final isLocationTurnedOn =
        await ref.read(locationServiceProvider).isLocationTurnedOn();
    if (isLocationTurnedOn) {
      final isPermissionGranted =
          await ref.read(locationServiceProvider).requestPermission();
      update(
        (currentState) => currentState.copyWith(
          isLocationTurnedOn: isLocationTurnedOn,
          isPermissionGranted: isPermissionGranted,
        ),
      );
    }
  }
}
