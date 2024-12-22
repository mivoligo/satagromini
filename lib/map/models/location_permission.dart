class LocationPermission {
  LocationPermission({
    required this.isLocationTurnedOn,
    required this.isPermissionGranted,
  });

  final bool isLocationTurnedOn;
  final bool isPermissionGranted;

  LocationPermission copyWith({
    bool? isLocationTurnedOn,
    bool? isPermissionGranted,
  }) {
    return LocationPermission(
      isLocationTurnedOn: isLocationTurnedOn ?? this.isLocationTurnedOn,
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is LocationPermission &&
      other.isLocationTurnedOn == isLocationTurnedOn &&
      other.isPermissionGranted == isPermissionGranted;

  @override
  int get hashCode => Object.hash(isLocationTurnedOn, isPermissionGranted);
}
