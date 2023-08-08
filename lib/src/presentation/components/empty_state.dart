import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomEmptyState extends StatelessWidget {
  final String iconPath;
  final String description;

  const CustomEmptyState({
    super.key,
    required this.iconPath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.s8,
                horizontal: Spacing.s16,
              ),
              child: CustomIcon(iconPath: iconPath),
            ),
            const SizedBox(height: Spacing.s16),
            CustomText(
              color: context.colors.kNeutralColor,
              style: TypographyType.body,
              text: description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
