import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';

class RepositoryItem extends StatelessWidget {
  final String iconPath;
  final String? text;

  const RepositoryItem({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIcon(iconPath: iconPath),
        const SizedBox(width: Spacing.s12),
        Expanded(
          child: CustomText(
            text: text,
            style: TypographyType.body,
          ),
        ),
      ],
    );
  }
}
