import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/colors.dart';

const String locale = 'pt_BR';

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  canvasColor: PaletteDark().kBackgrounDefaultColor,
  colorScheme: const ColorScheme.dark(),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
);

final ThemeData themeLight = ThemeData(
  useMaterial3: true,
  canvasColor: PaletteLight().kBackgrounDefaultColor,
  colorScheme: const ColorScheme.light(),
  dividerTheme: const DividerThemeData(
    color: Colors.transparent,
  ),
);
