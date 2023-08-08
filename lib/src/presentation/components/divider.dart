import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double height;
  final double width;

  const CustomDivider({
    super.key,
    this.color,
    this.height = Spacing.s0,
    this.width = Spacing.s0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Divider(
        color: color ?? context.colors.kNeutralColor,
        height: height,
        thickness: borderWidth,
      ),
    );
  }
}
