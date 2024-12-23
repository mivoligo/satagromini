import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satagromini/map/controllers/location_controller.dart';
import 'package:satagromini/map/views/widgets/controls.dart';
import 'package:satagromini/map/views/widgets/map_view.dart';
import 'package:satagromini/map/views/widgets/permission_check.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationPermissions = ref.watch(locationPermissionsStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        children: switch (locationPermissions) {
          AsyncData(:final value) => [
              if (value.isPermissionGranted && value.isLocationTurnedOn) ...[
                const Expanded(
                  child: MapView(),
                ),
                const Controls(),
              ] else
                PermissionCheck(
                  isLocationTurnedOn: value.isLocationTurnedOn,
                  onPressed: ref
                      .read(locationPermissionsStateProvider.notifier)
                      .requestPermissions,
                ),
            ],
          AsyncError(:final error) => [
              Text(
                'Unexpected problem happened :( \n'
                '$error\n'
                'Please contact me.',
                textAlign: TextAlign.center,
              ),
            ],
          _ => [const Center(child: CircularProgressIndicator.adaptive())],
        },
      ),
    );
  }
}
