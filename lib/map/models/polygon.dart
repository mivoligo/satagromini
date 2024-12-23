import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/utils/utils.dart';

class SortedPolygon {
  SortedPolygon({
    required List<Location> points,
  }) : points = sortPoints(points);

  final List<Location> points;
}
