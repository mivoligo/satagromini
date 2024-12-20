import 'package:flutter/material.dart';

class SingleLegend extends StatelessWidget {
  const SingleLegend({
    required this.name,
    required this.description,
    super.key,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name),
        const SizedBox(width: 16),
        Text(description),
      ],
    );
  }
}
