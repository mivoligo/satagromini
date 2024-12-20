import 'dart:math';

import 'package:latlong2/latlong.dart';

/// Algorytm do sortowania punktów dla poligonu.
/// Zapobiega przecinaniu się linii, ale przy skomplikowanych kształtach
/// nie działa zbyt poprawnie, tzn. zmienia połączenia wierzchołków ze względu
/// na przesuwający się "środek ciężkości" (centroidLat, centroidLng)
List<LatLng> sortPoints(List<LatLng> points) {
  if (points.length <= 3) {
    return points;
  }

  final centroidLat =
      points.map((p) => p.latitude).reduce((a, b) => a + b) / points.length;
  final centroidLng =
      points.map((p) => p.longitude).reduce((a, b) => a + b) / points.length;
  points.sort((a, b) {
    double angleA = atan2(a.longitude - centroidLng, a.latitude - centroidLat);
    double angleB = atan2(b.longitude - centroidLng, b.latitude - centroidLat);
    return angleA.compareTo(angleB);
  });
  return points;
}
