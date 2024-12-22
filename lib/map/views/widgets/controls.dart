import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:satagromini/map/controllers/location_controller.dart';
import 'package:satagromini/map/controllers/polygon_list_controller.dart';
import 'package:satagromini/map/controllers/temporary_polygon_controller.dart';
import 'package:satagromini/map/services/geo_location_service.dart';

class Controls extends ConsumerWidget {
  const Controls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temporaryPoints = ref.watch(temporaryPolygonControllerProvider);
    final hasTemporaryPoints = temporaryPoints.isNotEmpty;
    final isPolygon = temporaryPoints.length >= 3;
    return Column(
      children: [
        ElevatedButton(
          onPressed: hasTemporaryPoints
              ? ref
                  .read(temporaryPolygonControllerProvider.notifier)
                  .removeLastPoint
              : null,
          child: const Text('Remove last point'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: hasTemporaryPoints
              ? ref
                  .read(temporaryPolygonControllerProvider.notifier)
                  .removeAllPoints
              : null,
          child: const Text('Remove area'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: isPolygon
              ? ref.read(polygonListControllerProvider.notifier).addPolygon
              : null,
          child: const Text('Save area'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            final location =
                await ref.read(locationServiceProvider).getLocation();
            ref
                .read(mapControllerProvider)
                .move(LatLng(location.latitude, location.longitude), 18);
          },
          child: const Text('Center location'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
