import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';

class CustomLogo extends StatelessWidget {
  final String pathDark;
  final String pathLight;
  final Color? color;
  final double height;

  const CustomLogo({
    super.key,
    required this.pathDark,
    required this.pathLight,
    this.color,
    this.height = Spacing.s16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        context.isLight ? pathLight : pathDark,
        height: height,
      ),
    );
  }
}
