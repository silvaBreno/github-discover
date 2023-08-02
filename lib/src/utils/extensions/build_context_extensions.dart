import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get colors => Theme.of(this);

  bool get isLight => Theme.of(this).isLight;

  AppLocalizations get locales => AppLocalizations.of(this);
}
