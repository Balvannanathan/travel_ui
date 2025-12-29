import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EmailInputFormatter extends TextInputFormatter {
  static final RegExp _allowedChars = RegExp(r'[a-zA-Z0-9@._\-+]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Block spaces
    if (text.contains(' ')) {
      return oldValue;
    }

    // Allow only valid characters
    if (text.isNotEmpty && !_allowedChars.hasMatch(text.characters.last)) {
      return oldValue;
    }

    // Allow only ONE '@'
    if ('@'.allMatches(text).length > 1) {
      return oldValue;
    }

    // Allow '.' only AFTER '@'
    if (text.contains('.') && !text.contains('@')) {
      return oldValue;
    }

    // Allow only ONE '.' AFTER '@'
    if (text.contains('@')) {
      final afterAt = text.split('@').last;
      if ('.'.allMatches(afterAt).length > 1) {
        return oldValue;
      }
    }

    return newValue;
  }
}

class PasswordInputFormatter extends TextInputFormatter {
  final int maxLength;

  PasswordInputFormatter({this.maxLength = 32});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // No spaces allowed
    if (newValue.text.contains(' ')) {
      return oldValue;
    }

    // Max length
    if (newValue.text.length > maxLength) {
      return oldValue;
    }

    return newValue;
  }
}

class FullNameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Allow only letters and spaces
    text = text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

    // Remove leading spaces
    text = text.replaceAll(RegExp(r'^ +'), '');

    // Replace multiple spaces with single space
    text = text.replaceAll(RegExp(r' +'), ' ');

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class MobileNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Limit to 10 digits
    if (digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(0, 10);
    }

    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}
