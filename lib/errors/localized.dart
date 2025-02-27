import 'package:flutter/widgets.dart';

/// Genetic class able to localize and translate messages to the users.
abstract class Localized {

  /// Return the localized string.
  String? localizedString(BuildContext context);
}

abstract class LocalizedError extends Error implements Localized {}
