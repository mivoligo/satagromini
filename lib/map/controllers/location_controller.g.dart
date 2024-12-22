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
String _$locationServiceHash() => r'd0bf3bfcf805673b5482ebf0ebbb7dee11caac57';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = AutoDisposeProvider<LocationService>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = AutoDisposeProviderRef<LocationService>;
String _$locationStreamHash() => r'0ff83e749c8c191a355dec245770b743dd33b057';

/// See also [locationStream].
@ProviderFor(locationStream)
final locationStreamProvider = AutoDisposeStreamProvider<Location>.internal(
  locationStream,
  name: r'locationStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationStreamRef = AutoDisposeStreamProviderRef<Location>;
String _$firstValidLocationHash() =>
    r'e0431d0acba3e344a6dbfa92ce67c2025ec3e314';

/// See also [firstValidLocation].
@ProviderFor(firstValidLocation)
final firstValidLocationProvider = AutoDisposeStreamProvider<Location>.internal(
  firstValidLocation,
  name: r'firstValidLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firstValidLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirstValidLocationRef = AutoDisposeStreamProviderRef<Location>;
String _$locationPermissionsStateHash() =>
    r'6fe83d856a759478064e6fd2d0082ef6733a77f3';

/// See also [LocationPermissionsState].
@ProviderFor(LocationPermissionsState)
final locationPermissionsStateProvider = AutoDisposeAsyncNotifierProvider<
    LocationPermissionsState, LocationPermission>.internal(
  LocationPermissionsState.new,
  name: r'locationPermissionsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationPermissionsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationPermissionsState
    = AutoDisposeAsyncNotifier<LocationPermission>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
