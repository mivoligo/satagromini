import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// Algorytm do sortowania punktów dla poligonu.
/// Zapobiega przecinaniu się linii, ale przy skomplikowanych kształtach
/// nie działa zbyt poprawnie, tzn. zmienia połączenia wierzchołków ze względu
/// na przesuwający się "środek ciężkości" (centroidLat, centroidLng)
List<LatLng> sortPoints(List<LatLng> points) {
  if (points.length <= 3) {
    return points;
  }

  final copyOfPoints = [...points];

  final centroidLat =
      copyOfPoints.map((p) => p.latitude).reduce((a, b) => a + b) /
          copyOfPoints.length;
  final centroidLng =
      copyOfPoints.map((p) => p.longitude).reduce((a, b) => a + b) /
          copyOfPoints.length;
  copyOfPoints.sort((a, b) {
    double angleA = atan2(a.longitude - centroidLng, a.latitude - centroidLat);
    double angleB = atan2(b.longitude - centroidLng, b.latitude - centroidLat);
    return angleA.compareTo(angleB);
  });
  return copyOfPoints;
}

const polygonColors = <Color>[
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.blue,
  Colors.teal,
  Colors.lightGreen,
  Colors.amber,
  Colors.brown,
];
