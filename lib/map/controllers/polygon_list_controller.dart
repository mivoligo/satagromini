import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/map/controllers/temporary_polygon_controller.dart';
import 'package:satagromini/map/models/polygon.dart';

part 'polygon_list_controller.g.dart';

@riverpod
class PolygonListController extends _$PolygonListController {
  @override
  List<SortedPolygon> build() => [];

  void addPolygon() {
    final temporaryPoints = ref.read(temporaryPolygonControllerProvider);
    final polygon = SortedPolygon(points: temporaryPoints);
    ref.read(temporaryPolygonControllerProvider.notifier).removeAllPoints();

    state = [...state, polygon];
  }
}
