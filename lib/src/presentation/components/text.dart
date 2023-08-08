import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TypographyType style;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool textDecoration;
  final bool wrap;

  const CustomText({
    super.key,
    required this.text,
    required this.style,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.textDecoration = false,
    this.wrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? context.locales.nullText,
      style: typography[style]?.copyWith(
        color: color ?? context.colors.kForegroundColor,
        decoration: textDecoration ? TextDecoration.lineThrough : null,
      ),
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: true,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: wrap,
    );
  }
}
