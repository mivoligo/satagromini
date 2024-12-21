// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapControllerHash() => r'd5ebead508cf75701bdc8f5f9e2031e2ed27d0bb';

/// See also [mapController].
@ProviderFor(mapController)
final mapControllerProvider = AutoDisposeProvider<MapController>.internal(
  mapController,
  name: r'mapControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapControllerRef = AutoDisposeProviderRef<MapController>;
String _$locationControllerHash() =>
    r'f8e85faaaa4870ea53bcc4a16b453c534a4a05b6';

/// See also [LocationController].
@ProviderFor(LocationController)
final locationControllerProvider =
    AutoDisposeAsyncNotifierProvider<LocationController, Location>.internal(
  LocationController.new,
  name: r'locationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationController = AutoDisposeAsyncNotifier<Location>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
