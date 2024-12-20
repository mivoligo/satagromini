import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(markers: [
      Marker(
        point: LatLng(latitude, longitude),
        width: 16,
        height: 16,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.indigo,
            shape: BoxShape.circle,
            border: Border(
              right: BorderSide(color: Colors.white),
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
