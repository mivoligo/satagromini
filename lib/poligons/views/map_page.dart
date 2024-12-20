import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/poligons/models/polygon.dart';
import 'package:satagromini/poligons/views/widgets/controls.dart';
import 'package:satagromini/poligons/views/widgets/location_marker.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final pointsCor = <LatLng>[];

  @override
  Widget build(BuildContext context) {
    var sortedPoly = [
      SortedPolygon(points: [...pointsCor])
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter:
                    const LatLng(52.2111667513729, 20.98730651258061),
                initialZoom: 18,
                onTap: (tapPosition, point) {
                  print(point);
                  setState(() {
                    pointsCor.add(point);
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                if (pointsCor.isNotEmpty)
                  PolygonLayer(
                    polygons: [
                      ...sortedPoly.map(
                        (e) => Polygon(
                          points: e.points,
                          borderColor: Colors.red,
                          borderStrokeWidth: 2,
                        ),
                      ),
                    ],
                  ),
                MarkerLayer(markers: [
                  ...pointsCor.map(
                    (e) => Marker(
                        point: e,
                        child: Container(
                          color: Colors.green,
                        )),
                  )
                ]),
                const LocationMarker(latitude: 0.3, longitude: 2),
              ],
            ),
          ),
          Controls(
            hasPolygon: true,
            onRemoveLastPoint: () {},
            onRemoveArea: () {},
            onSaveArea: () {},
            onCenterLocation: () {},
          ),
        ],
      ),
    );
  }
}
