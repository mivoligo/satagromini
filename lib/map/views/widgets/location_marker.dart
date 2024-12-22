import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/map/controllers/location_controller.dart';

class LocationMarker extends ConsumerWidget {
  const LocationMarker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationStream = ref.watch(locationStreamProvider);

    return switch (locationStream) {
      AsyncData(:final value) => MarkerLayer(markers: [
          Marker(
            point: LatLng(value.latitude, value.longitude),
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
        ]),
      _ => const Center(child: CircularProgressIndicator())
    };
  }
}
