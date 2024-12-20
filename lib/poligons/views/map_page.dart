import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter:
              LatLng(51.509364, -0.128928), // Center the map over London
          initialZoom: 9.2,
          onTap: (tapPosition, point) {
            print(tapPosition.global);
            print(point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: [
                  LatLng(0, 0),
                  LatLng(0, 5),
                  LatLng(2, 4),
                  LatLng(-2, -2)
                ],
                color: Colors.black26,
                borderColor: Colors.red,
                borderStrokeWidth: 2,
                label: 'LABEL W',
              ),
            ],
          ),
          MarkerLayer(markers: [
            Marker(
                point: LatLng(0, 1),
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ))
          ]),
        ],
      ),
    );
  }
}
