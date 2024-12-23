import 'package:flutter/material.dart';

class PermissionCheck extends StatelessWidget {
  const PermissionCheck({
    required this.isLocationTurnedOn,
    required this.onPressed,
    super.key,
  });

  final bool isLocationTurnedOn;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isLocationTurnedOn
              ? 'Click the button to request location permission'
              : 'Please check if location service on your device is enabled and try again',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            isLocationTurnedOn ? 'Request permission' : 'Try again',
          ),
        ),
      ],
    );
  }
}
