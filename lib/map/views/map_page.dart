import 'package:flutter/material.dart';
import 'package:satagromini/map/views/widgets/controls.dart';
import 'package:satagromini/map/views/widgets/map_view.dart';

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
      body: const Column(
        children: [
          Expanded(
            child: MapView(),
          ),
          Controls(),
        ],
      ),
    );
  }
}
