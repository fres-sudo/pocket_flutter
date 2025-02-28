import 'package:flutter/material.dart';

class NotchBottomSheet extends StatelessWidget {
  const NotchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 4,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Theme.of(context).colorScheme.surfaceContainerHigh),
        ),
      ),
    );
  }
}
