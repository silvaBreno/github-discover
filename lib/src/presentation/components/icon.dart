import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomIcon extends StatelessWidget {
  final String iconPath;
  final Color? color;
  final double dimension;

  const CustomIcon({
    super.key,
    required this.iconPath,
    this.color,
    this.dimension = Spacing.s20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: SvgPicture.asset(
        iconPath,
        height: dimension,
        width: dimension,
        colorFilter: ColorFilter.mode(
          color ?? context.colors.kForegroundColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
