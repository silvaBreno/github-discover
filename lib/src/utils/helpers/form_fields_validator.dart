import 'package:flutter/material.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';

String? titleFieldValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return context.locales.skillEmptyError;
  }
  if (value.length > 50) {
    return context.locales.skillLengthError;
  }
  return null;
}

String? descriptionFieldValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return context.locales.descriptionEmptyError;
  }
  if (value.length > 200) {
    return context.locales.descriptionLengthError;
  }
  return null;
}
