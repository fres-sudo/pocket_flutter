import 'package:flutter/widgets.dart';
import 'package:pocket_flutter/errors/localized.dart';

abstract class UserErrors extends LocalizedError {}

class UserNotFoundError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "User not found";
}

class UpdatingUserImageError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to update profile picture";
}

class DeleteUserImageError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to delete profile picture";
}

class UpdateUserError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to update user information";
}

class DeleteUserError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Failed to delete user account";
}

class InvalidUserDataError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Invalid user information provided";
}

class NetworkUserError extends UserErrors {
  @override
  String? localizedString(BuildContext context) => "Network error while processing user request";
}
