import 'package:flutter/material.dart';
import 'package:pocket_flutter/ui/device.dart';

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Sizes.edgeInsetsPhone,
      children: [
        Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.error,
        ),
        Text(
          "t.errors.image_error",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ],
    );
  }
}
