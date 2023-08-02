import 'dart:ui';

class ThemeColorsFactory {
  final Map<Brightness, ColorPalette> map = {
    Brightness.dark: PaletteDark(),
    Brightness.light: PaletteLight(),
  };

  ColorPalette create(Brightness type) {
    if (!map.containsKey(type)) {
      throw Exception('brightness type not found');
    }

    return map[type] as ColorPalette;
  }
}

abstract class ColorPalette {
  late Color kBackgrounDefaultColor;
  late Color kBackgrounSubtleColor;
  late Color kForegroundColor;
  late Color kNeutralColor;
  late Color kWhiteColor;
  late Color kAccentColor;
  late Color kAlertSuccessColor;
  late Color kAlertAttentionColor;
  late Color kAlertDangerColor;
}

class PaletteDark implements ColorPalette {
  @override
  late Color kBackgrounDefaultColor = const Color(0xff181818);

  @override
  late Color kBackgrounSubtleColor = const Color(0xff101010);

  @override
  late Color kForegroundColor = const Color(0xffFFFFFF);

  @override
  late Color kNeutralColor = const Color(0xffD0D7DE);

  @override
  late Color kWhiteColor = const Color(0xffFFFFFF);

  @override
  late Color kAccentColor = const Color(0xff0969DA);

  @override
  late Color kAlertSuccessColor = const Color(0xff1F883D);

  @override
  late Color kAlertAttentionColor = const Color(0xffBF8700);

  @override
  late Color kAlertDangerColor = const Color(0xffCF222E);
}

class PaletteLight implements ColorPalette {
  @override
  late Color kBackgrounDefaultColor = const Color(0xffFFFFFF);

  @override
  late Color kBackgrounSubtleColor = const Color(0xffF7F7F7);

  @override
  late Color kForegroundColor = const Color(0xff101010);

  @override
  late Color kNeutralColor = const Color(0xffD0D7DE);

  @override
  late Color kWhiteColor = const Color(0xffFFFFFF);

  @override
  late Color kAccentColor = const Color(0xff0969DA);

  @override
  late Color kAlertSuccessColor = const Color(0xff1F883D);

  @override
  late Color kAlertAttentionColor = const Color(0xffBF8700);

  @override
  late Color kAlertDangerColor = const Color(0xffCF222E);
}
