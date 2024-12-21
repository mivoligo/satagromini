class Location {
  const Location({
    required this.latitude,
    required this.longitude,
  });

  Location.empty()
      : this(
          latitude: 52.2111667513729,
          longitude: 20.98730651258061,
        );

  final double latitude;
  final double longitude;
}
