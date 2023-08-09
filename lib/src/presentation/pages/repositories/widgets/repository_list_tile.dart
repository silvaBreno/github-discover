import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/avatar.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class RepositoryListTile extends StatelessWidget {
  final Repository repository;
  final VoidCallback onTap;

  const RepositoryListTile({
    super.key,
    required this.repository,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: borderCard(context.colors.kBackgrounSubtleColor),
        margin: const EdgeInsets.only(bottom: Spacing.s8),
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.s16,
          vertical: Spacing.s16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAvatar(
              avatarUrl: repository.owner?.avatarUrl,
              radius: Spacing.s32,
            ),
            const SizedBox(width: Spacing.s16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: CustomText(
                    style: TypographyType.title,
                    text: repository.fullName,
                    textOverflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: Spacing.s8),
                CustomText(
                  color: context.colors.kAccentColor,
                  style: TypographyType.label,
                  text: repository.name,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
