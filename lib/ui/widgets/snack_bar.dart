import 'package:flutter/material.dart';
import 'package:pocket_flutter/i18n/strings.g.dart';
import 'package:pocket_flutter/ui/extensions.dart';

enum SnackBarType { success, error, warning, info }

void showSnackBar(
  BuildContext context, {
  String? message,
  SnackBarType type = SnackBarType.info,
}) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 5),
    content: Text(message ?? t.errors.generic),
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: switch (type) {
                  SnackBarType.error => context.isDarkMode ? Colors.red[400] : Colors.red[600],
                  SnackBarType.warning => context.isDarkMode ? Colors.orangeAccent[400] : Colors.orangeAccent[600],
                  SnackBarType.success => context.isDarkMode ? Colors.green[400] : Colors.green[600],
                  SnackBarType.info => context.isDarkMode ? Colors.grey[400] : Colors.grey[600]
                } ??
                Colors.grey)),
    backgroundColor: switch (type) {
      SnackBarType.error => context.isDarkMode ? Colors.red[800] : Colors.red[200],
      SnackBarType.warning => context.isDarkMode ? Colors.orangeAccent[800] : Colors.orangeAccent[200],
      SnackBarType.success => context.isDarkMode ? Colors.green[800] : Colors.green[200],
      SnackBarType.info => context.isDarkMode ? Colors.grey[800] : Colors.grey[200]
    },
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void closeSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
