import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/presentation/components/avatar.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/profile_item.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({
    super.key,
    required this.profile,
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
            avatarUrl: profile.avatarUrl,
            radius: Spacing.s64,
          ),
          const SizedBox(height: Spacing.s16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: profile.name,
                style: TypographyType.title,
              ),
              CustomText(
                text: profile.login,
                style: TypographyType.body,
              ),
            ],
          ),
          const SizedBox(height: Spacing.s24),
          CustomText(
            text: profile.bio,
            style: TypographyType.body,
          ),
          const SizedBox(height: Spacing.s24),
          ProfileItem(
            iconPath: Asset.peopleIcon,
            text: context.locales.followersFollowingItem(
              formatter.format(profile.followers ?? 0),
              formatter.format(profile.following ?? 0),
            ),
          ),
          const SizedBox(height: Spacing.s8),
          ProfileItem(
            iconPath: Asset.organizationIcon,
            text: profile.company,
          ),
          const SizedBox(height: Spacing.s8),
          ProfileItem(
            iconPath: Asset.locationIcon,
            text: profile.location,
          ),
          const SizedBox(height: Spacing.s8),
          ProfileItem(
            iconPath: Asset.linkIcon,
            text: profile.blog,
          ),
        ],
      ),
    );
  }
}
