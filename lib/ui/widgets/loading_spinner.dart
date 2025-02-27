import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key, this.size = 24, this.isAdaptive = true, this.color});

  final double size;
  final bool isAdaptive;
  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: size,
          width: size,
          child: isAdaptive
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: color ?? Theme.of(context).colorScheme.primary,
                )
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).colorScheme.primary),
                ),
        ),
      );
}
