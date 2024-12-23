import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/map/models/location.dart';

part 'temporary_polygon_controller.g.dart';

@riverpod
class TemporaryPolygonController extends _$TemporaryPolygonController {
  @override
  List<Location> build() {
    return [];
  }

  void addPoint(Location point) {
    state = [...state, point];
  }

  void removeLastPoint() {
    state = [...state..removeLast()];
  }

  void removeAllPoints() {
    state = [];
  }
}
