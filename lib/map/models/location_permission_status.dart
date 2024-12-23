class LocationPermissionStatus {
  LocationPermissionStatus({
    required this.isLocationTurnedOn,
    required this.isPermissionGranted,
  });

  final bool isLocationTurnedOn;
  final bool isPermissionGranted;

  LocationPermissionStatus copyWith({
    bool? isLocationTurnedOn,
    bool? isPermissionGranted,
  }) {
    return LocationPermissionStatus(
      isLocationTurnedOn: isLocationTurnedOn ?? this.isLocationTurnedOn,
      isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is LocationPermissionStatus &&
      other.isLocationTurnedOn == isLocationTurnedOn &&
      other.isPermissionGranted == isPermissionGranted;

  @override
  int get hashCode => Object.hash(isLocationTurnedOn, isPermissionGranted);
}
