import 'package:flutter/widgets.dart';
import 'package:pocket_flutter/errors/localized.dart';

abstract class AuthErrors extends LocalizedError {}

class SignInError extends AuthErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to sign in";
}

class SignUpError extends AuthErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to sign up";
}

class RefreshTokenError extends AuthErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to refresh session user";
}
