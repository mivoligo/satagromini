import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  const Controls({
    required this.hasPolygon,
    required this.onRemoveLastPoint,
    required this.onRemoveArea,
    required this.onSaveArea,
    required this.onCenterLocation,
    super.key,
  });

  final bool hasPolygon;
  final VoidCallback onRemoveLastPoint;
  final VoidCallback onRemoveArea;
  final VoidCallback onSaveArea;
  final VoidCallback onCenterLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (hasPolygon) ...[
          ElevatedButton(
            onPressed: onRemoveLastPoint,
            child: const Text('Remove last point'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onRemoveArea,
            child: const Text('Remove area'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onSaveArea,
            child: const Text('Save area'),
          ),
        ],
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
