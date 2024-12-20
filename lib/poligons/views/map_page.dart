import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/poligons/controllers/polygon_list_controller.dart';
import 'package:satagromini/poligons/controllers/single_polygon_controller.dart';
import 'package:satagromini/poligons/views/widgets/controls.dart';
import 'package:satagromini/poligons/views/widgets/location_marker.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final polygonList = ref.watch(polygonListControllerProvider);
                final temporaryPoints =
                    ref.watch(temporaryPolygonControllerProvider);

                return FlutterMap(
                  options: MapOptions(
                    initialCenter:
                        const LatLng(52.2111667513729, 20.98730651258061),
                    initialZoom: 18,
                    onTap: (tapPosition, point) {
                      print(point);
                      ref
                          .read(temporaryPolygonControllerProvider.notifier)
                          .addPoint(point);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    // if (temporaryPoints.isNotEmpty || polygonList.isNotEmpty)
                    PolygonLayer(
                      polygons: [
                        ...polygonList.indexed.map(
                          (e) => Polygon(
                              points: e.$2.points,
                              borderStrokeWidth: 2,
                              borderColor: Colors
                                  .primaries[e.$1 % Colors.primaries.length],
                              color: Colors.black26),
                        ),
                        if (temporaryPoints.isNotEmpty)
                          Polygon(
                            points: temporaryPoints,
                            borderColor: Colors.red,
                            borderStrokeWidth: 2,
                          ),
                      ],
                    ),
                    MarkerLayer(markers: [
                      ...temporaryPoints.map(
                        (e) => Marker(
                          point: e,
                          child: Container(color: Colors.red),
                          width: 8,
                          height: 8,
                        ),
                      )
                    ]),
                    const LocationMarker(latitude: 0.3, longitude: 2),
                  ],
                );
              },
            ),
          ),
          Controls(
            onCenterLocation: () {},
          ),
        ],
      ),
    );
  }
}
