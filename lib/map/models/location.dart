class Location {
  const Location({
    required this.latitude,
    required this.longitude,
  });

  const Location.start()
      : this(
          latitude: 52.2111667513729,
          longitude: 20.98730651258061,
        );

  final double latitude;
  final double longitude;

  @override
  bool operator ==(Object other) =>
      other is Location &&
      other.latitude == latitude &&
      other.longitude == longitude;

  @override
  int get hashCode => Object.hash(latitude, longitude);
}
