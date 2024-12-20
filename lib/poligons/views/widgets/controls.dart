import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satagromini/poligons/controllers/polygon_list_controller.dart';
import 'package:satagromini/poligons/controllers/single_polygon_controller.dart';

class Controls extends ConsumerWidget {
  const Controls({
    required this.onCenterLocation,
    super.key,
  });

  final VoidCallback onCenterLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasTemporaryPoints =
        ref.watch(singlePolygonControllerProvider).isNotEmpty;
    return Column(
      children: [
        ElevatedButton(
          onPressed: hasTemporaryPoints
              ? ref
                  .read(singlePolygonControllerProvider.notifier)
                  .removeLastPoint
              : null,
          child: const Text('Remove last point'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: hasTemporaryPoints
              ? ref
                  .read(singlePolygonControllerProvider.notifier)
                  .removeAllPoints
              : null,
          child: const Text('Remove area'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: hasTemporaryPoints
              ? ref.read(polygonListControllerProvider.notifier).addPolygon
              : null,
          child: const Text('Save area'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onCenterLocation,
          child: const Text('Center location'),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
