import 'package:string_validator/string_validator.dart' as validator;

mixin ValidationMixion {
  String? isValidPassword(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return 'This field can not be empty';
    }
    if (value.length < 6) {
      return 'Password must have minimum 6 characters';
    }
  }

  String? isEmail(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return 'This field can not be empty';
    }
    if (!validator.isEmail(value)) {
      return 'Value must be email type';
    }
    return null;
  }

  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Required field ';
    return null;
  }

  String? equalfield(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Required field ';
    return null;
  }
}
