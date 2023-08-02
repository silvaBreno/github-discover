import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/colors.dart';

extension ThemeDataExtension on ThemeData {
  bool get isLight => brightness == Brightness.light;

  ColorPalette get color => ThemeColorsFactory().create(brightness);

  Color get kBackgrounDefaultColor => color.kBackgrounDefaultColor;
  Color get kBackgrounSubtleColor => color.kBackgrounSubtleColor;
  Color get kForegroundColor => color.kForegroundColor;
  Color get kNeutralColor => color.kNeutralColor;
  Color get kWhiteColor => color.kWhiteColor;
  Color get kAccentColor => color.kAccentColor;
  Color get kAlertSuccessColor => color.kAlertSuccessColor;
  Color get kAlertAttentionColor => color.kAlertAttentionColor;
  Color get kAlertDangerColor => color.kAlertDangerColor;
}
