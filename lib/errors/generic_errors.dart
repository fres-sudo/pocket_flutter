import 'package:flutter/material.dart';
import 'package:pocket_flutter/errors/localized.dart';
import 'package:pocket_flutter/i18n/strings.g.dart';

class GenericError extends LocalizedError {
  @override
  String? localizedString(BuildContext context) {
    return t.errors.generic;
  }
}

class NetworkError extends GenericError {
  @override
  String? localizedString(BuildContext context) {
    return "t.errors.network";
  }
}

class InvalidRequestError extends GenericError {
  @override
  String? localizedString(BuildContext context) {
    return "t.errors.not_found";
  }
}

class UnauthorizedError extends GenericError {
  @override
  String? localizedString(BuildContext context) {
    return t.errors.not_allowed;
  }
}

class TooManyRequestsError extends GenericError {
  @override
  String? localizedString(BuildContext context) {
    return t.errors.too_many_requests;
  }
}

class NotFoundError extends GenericError {
  @override
  String? localizedString(BuildContext context) {
    return "t.errors.not_found";
  }
}
