import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_polygon_controller.g.dart';

@riverpod
class SinglePolygonController extends _$SinglePolygonController {
  @override
  List<LatLng> build() {
    return [];
  }

  void addPoint(LatLng point) {
    state = [...state, point];
  }

  void removeLastPoint() {
    state = [...state..removeLast()];
  }

  void removeAllPoints() {
    state = [];
  }
}
