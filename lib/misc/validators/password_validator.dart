import 'package:pocket_flutter/i18n/strings.g.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A validator class for password validation.
///
/// This validator checks if a password meets the following criteria:
/// * Must not be empty
/// * Must be at least 8 characters long
/// * Must contain at least one uppercase letter
/// * Must contain at least one lowercase letter
/// * Must contain at least one digit
///
/// Returns a Map with validation error messages if any criteria is not met:
/// * 'required' - Password is empty
/// * 'minLength' - Password is less than 8 characters
/// * 'uppercase' - Password has no uppercase letter
/// * 'lowercase' - Password has no lowercase letter
/// * 'digit' - Password has no digit
///
/// Returns null if all validation criteria are met.
class PasswordValidator extends Validator<dynamic> {
  const PasswordValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final password = control.value as String?;

    if (password == null || password.isEmpty) {
      return {
        'required': t.errors.validation.password.required,
      };
    }

    if (password.length < 8) {
      return {'minLength': t.errors.validation.password.min_length};
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return {
        'uppercase': t.errors.validation.password.upper_case,
      };
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return {
        'lowercase': t.errors.validation.password.lower_case,
      };
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return {
        'digit': t.errors.validation.password.digit,
      };
    }

    return null;
  }
}
