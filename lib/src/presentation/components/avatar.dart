import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomAvatar extends StatelessWidget {
  final String? avatarUrl;
  final double radius;

  const CustomAvatar({
    super.key,
    this.avatarUrl,
    this.radius = Spacing.s24,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      child: avatarUrl != null
          ? CircleAvatar(
              radius: radius,
              backgroundColor: context.colors.kAccentColor,
              backgroundImage: NetworkImage(avatarUrl!),
            )
          : CustomIcon(
              iconPath: Logo.markWhite,
              dimension: radius,
            ),
    );
  }
}
