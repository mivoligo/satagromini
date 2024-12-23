import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/map/controllers/location_controller.dart';
import 'package:satagromini/map/controllers/polygon_list_controller.dart';
import 'package:satagromini/map/controllers/temporary_polygon_controller.dart';
import 'package:satagromini/map/models/location.dart';
import 'package:satagromini/map/views/widgets/location_marker.dart';
import 'package:satagromini/utils/utils.dart';

class MapView extends ConsumerWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const startingLocation = Location.start();
    final polygonList = ref.watch(polygonListControllerProvider);
    final temporaryPoints = ref.watch(temporaryPolygonControllerProvider);
    final mapController = ref.watch(mapControllerProvider);

    ref.listen(
      firstValidLocationProvider,
      (_, next) {
        next.whenData(
          (location) => ref
              .read(mapControllerProvider)
              .move(LatLng(location.latitude, location.longitude), 18),
        );
      },
    );

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: LatLng(
          startingLocation.latitude,
          startingLocation.longitude,
        ),
        initialZoom: 18,
        onTap: (_, point) {
          ref.read(temporaryPolygonControllerProvider.notifier).addPoint(point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        PolygonLayer(
          polygons: [
            ...polygonList.indexed.map(
              (e) => Polygon(
                points: e.$2.points,
                borderStrokeWidth: 2,
                borderColor: polygonColors[e.$1 % polygonColors.length],
                color: Colors.black26,
              ),
            ),
            if (temporaryPoints.isNotEmpty)
              Polygon(
                points: sortPoints(temporaryPoints),
                borderColor: Colors.red,
                borderStrokeWidth: 2,
              ),
          ],
        ),
        MarkerLayer(
          markers: [
            ...temporaryPoints.map(
              (e) => Marker(
                point: e,
                child: Container(color: Colors.red),
                width: 8,
                height: 8,
              ),
            )
          ],
        ),
        const LocationMarker(),
      ],
    );
  }
}
