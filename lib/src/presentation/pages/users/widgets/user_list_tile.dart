import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/components/avatar.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: borderCard(context.colors.kBackgrounSubtleColor),
        padding: const EdgeInsets.all(Spacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAvatar(
              avatarUrl: user.avatarUrl,
              radius: Spacing.s48,
            ),
            const SizedBox(height: Spacing.s8),
            Expanded(
              child: CustomText(
                style: TypographyType.title,
                text: user.name,
                textOverflow: TextOverflow.fade,
                wrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
