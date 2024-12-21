import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/map/services/geo_location_service.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  Future<Location> build() async {
    final locationService = ref.watch(locationServiceProvider);
    final location = await locationService.getLocation();
    return location;
  }

  Future<void> getLocation() async {
    final locationService = ref.read(locationServiceProvider);
    final location = await locationService.getLocation();

    update((currentState) => location);
  }
}

@riverpod
MapController mapController(Ref ref) => MapController();
