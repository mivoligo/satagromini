import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/map/services/geo_location_service.dart';

part 'location_controller.g.dart';

@riverpod
MapController mapController(Ref ref) => MapController();

@riverpod
Stream<Location> locationStream(Ref ref) {
  return ref.watch(locationServiceProvider).getLocationStream();
}

@riverpod
Stream<Location> firstValidLocation(Ref ref) {
  return ref.watch(locationServiceProvider).getLocationStream().take(1);
}
