import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/repository_item.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class RepositoryListTile extends StatefulWidget {
  final Repository repository;

  const RepositoryListTile({
    super.key,
    required this.repository,
  });

  @override
  State<RepositoryListTile> createState() => _RepositoryListTileState();
}

class _RepositoryListTileState extends State<RepositoryListTile> {
  bool isExpanded = false;

  handleExpansion(bool value) {
    setState(() {
      isExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: locale);

    return Container(
      decoration: borderCard(context.colors.kBackgrounSubtleColor),
      margin: const EdgeInsets.only(bottom: Spacing.s8),
      padding: const EdgeInsets.all(Spacing.s16),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: handleExpansion,
          expandedAlignment: Alignment.centerLeft,
          title: CustomText(
            text: widget.repository.name,
            color: context.colors.kForegroundColor,
            style: TypographyType.title,
          ),
          trailing: RotatedBox(
            quarterTurns: isExpanded ? 4 : 2,
            child: const CustomIcon(iconPath: Asset.chevronIcon),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.s24,
                vertical: Spacing.s8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: widget.repository.description,
                    style: TypographyType.body,
                  ),
                  const SizedBox(height: Spacing.s16),
                  RepositoryItem(
                    iconPath: Asset.codeIcon,
                    text: widget.repository.language,
                  ),
                  const SizedBox(height: Spacing.s16),
                  RepositoryItem(
                    iconPath: Asset.lawIcon,
                    text: widget.repository.license?.name,
                  ),
                  const SizedBox(height: Spacing.s16),
                  RepositoryItem(
                    iconPath: Asset.starIcon,
                    text: formatter.format(widget.repository.stargazersCount),
                  ),
                  const SizedBox(height: Spacing.s16),
                  RepositoryItem(
                    iconPath: Asset.eyeIcon,
                    text: formatter.format(widget.repository.subscribersCount),
                  ),
                  const SizedBox(height: Spacing.s16),
                  RepositoryItem(
                    iconPath: Asset.repoForkedIcon,
                    text: formatter.format(widget.repository.forksCount),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
