import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temporary_polygon_controller.g.dart';

@riverpod
class TemporaryPolygonController extends _$TemporaryPolygonController {
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
