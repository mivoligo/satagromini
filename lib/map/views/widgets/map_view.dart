import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/map/controllers/location_controller.dart';
import 'package:satagromini/map/controllers/polygon_list_controller.dart';
import 'package:satagromini/map/controllers/single_polygon_controller.dart';
import 'package:satagromini/map/views/widgets/location_marker.dart';
import 'package:satagromini/utils/utils.dart';

class MapView extends ConsumerWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final polygonList = ref.watch(polygonListControllerProvider);
    final temporaryPoints = ref.watch(temporaryPolygonControllerProvider);
    final currentLocation = ref.watch(locationControllerProvider);
    final mapController = ref.watch(mapControllerProvider);
    return switch (currentLocation) {
      AsyncData(:final value) => FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: LatLng(value.latitude, value.longitude),
            initialZoom: 18,
            onTap: (_, point) {
              ref
                  .read(temporaryPolygonControllerProvider.notifier)
                  .addPoint(point);
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
                      borderColor:
                          Colors.primaries[e.$1 % Colors.primaries.length],
                      color: Colors.black26),
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
              markers: temporaryPoints
                  .map(
                    (e) => Marker(
                      point: e,
                      child: Container(color: Colors.red),
                      width: 8,
                      height: 8,
                    ),
                  )
                  .toList(),
            ),
            LocationMarker(
                latitude: value.latitude, longitude: value.longitude),
          ],
        ),
      AsyncError() => const Center(
          child: Text('Please enable location service on your device'),
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
