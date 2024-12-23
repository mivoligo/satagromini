import 'package:flutter/material.dart';
import 'package:satagromini/table/views/widgets/single_legend.dart';

class Legend extends StatelessWidget {
  const Legend({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleLegend(name: '1', description: 'Atomic number'),
            SingleLegend(name: '2', description: 'Standard atomic weight'),
            SingleLegend(name: '3', description: 'Density'),
            SingleLegend(name: '4', description: 'Melting point'),
            SingleLegend(name: '5', description: 'Boiling point'),
            SingleLegend(name: '6', description: 'Specific heat capacity'),
            SingleLegend(name: '7', description: 'Electro-negativity'),
            SingleLegend(name: '8', description: 'Abundance in Earth\'s crust'),
          ],
        ),
      ),
    );
  }
}
