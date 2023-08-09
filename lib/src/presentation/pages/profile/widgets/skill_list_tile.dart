import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/components/checkbox.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class SkillListTile extends StatelessWidget {
  final Skill skill;
  final VoidCallback onClickDelete;
  final VoidCallback onToggleComplete;

  const SkillListTile({
    required this.skill,
    required this.onClickDelete,
    required this.onToggleComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(skill),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onClickDelete();
      },
      background: Container(
        decoration: borderCard(context.colors.kAlertDangerColor),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Spacing.s20),
        child: CustomIcon(
          iconPath: Asset.trashIcon,
          color: context.colors.kWhiteColor,
        ),
      ),
      child: Container(
        decoration: borderCard(context.colors.kBackgrounSubtleColor),
        margin: const EdgeInsets.only(bottom: Spacing.s8),
        child: ListTile(
          title: CustomText(
            text: skill.title,
            style: TypographyType.body,
            textDecoration: skill.isCompleted,
          ),
          subtitle: CustomText(
            text: skill.description,
            style: TypographyType.body,
            textDecoration: skill.isCompleted,
          ),
          leading: CustomCheckbox(
            initialValue: skill.isCompleted,
            onChanged: (_) {
              onToggleComplete();
            },
          ),
        ),
      ),
    );
  }
}
