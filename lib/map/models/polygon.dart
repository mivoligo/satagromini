import 'package:latlong2/latlong.dart';
import 'package:satagromini/utils/utils.dart';

class SortedPolygon {
  SortedPolygon({
    required List<LatLng> points,
  }) : points = sortPoints(points);

  final List<LatLng> points;
}
