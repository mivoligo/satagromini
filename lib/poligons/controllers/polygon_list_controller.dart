import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satagromini/poligons/controllers/single_polygon_controller.dart';
import 'package:satagromini/poligons/models/polygon.dart';

part 'polygon_list_controller.g.dart';

@riverpod
class PolygonListController extends _$PolygonListController {
  @override
  List<SortedPolygon> build() => [];

  void addPolygon() {
    final temporaryPoints = ref.read(singlePolygonControllerProvider);
    final polygon = SortedPolygon(points: [...temporaryPoints]);
    ref.read(singlePolygonControllerProvider.notifier).removeAllPoints();

    state = [...state, polygon];
  }
}
