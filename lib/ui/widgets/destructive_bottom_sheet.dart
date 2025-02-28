import 'package:flutter/material.dart';
import 'package:pocket_flutter/ui/device.dart';
import 'package:pocket_flutter/ui/widgets/notch_bottom_sheet.dart';

class DestructiveBottomSheet extends StatelessWidget {
  const DestructiveBottomSheet({
    super.key,
    required this.title,
    required this.buttonText,
    required this.description,
    required this.onPress,
  });

  final String title;
  final String buttonText;
  final String description;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 36, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotchBottomSheet(),
          const SizedBox(
            height: Sizes.md,
          ),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: Sizes.sm,
          ),
          Text(description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError),
            onPressed: onPress,
            child: Center(
              child: Text(
                buttonText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
