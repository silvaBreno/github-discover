import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/components/avatar.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/user_item.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: locale);

    return Container(
      decoration: borderCard(context.colors.kBackgrounSubtleColor),
      padding: const EdgeInsets.all(Spacing.s24),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAvatar(
            avatarUrl: user.avatarUrl,
            radius: Spacing.s64,
          ),
          const SizedBox(height: Spacing.s16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: user.name,
                style: TypographyType.title,
              ),
              CustomText(
                text: user.login,
                style: TypographyType.body,
              ),
            ],
          ),
          const SizedBox(height: Spacing.s24),
          CustomText(
            text: user.bio,
            style: TypographyType.body,
          ),
          const SizedBox(height: Spacing.s24),
          UserItem(
            iconPath: Asset.peopleIcon,
            text: context.locales.followersFollowingItem(
              formatter.format(user.followers ?? 0),
              formatter.format(user.following ?? 0),
            ),
          ),
          const SizedBox(height: Spacing.s8),
          UserItem(
            iconPath: Asset.organizationIcon,
            text: user.company,
          ),
          const SizedBox(height: Spacing.s8),
          UserItem(
            iconPath: Asset.locationIcon,
            text: user.location,
          ),
          const SizedBox(height: Spacing.s8),
          UserItem(
            iconPath: Asset.linkIcon,
            text: user.blog,
          ),
        ],
      ),
    );
  }
}
