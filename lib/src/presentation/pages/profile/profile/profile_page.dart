import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/floating_action_button.dart';
import 'package:github_discover/src/presentation/components/responsive_column_layout.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/profile_card.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/skill_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class ProfilePage extends StatefulWidget {
  final Profile? profile;
  final Skills? skills;
  final VoidCallback? onClickAddItem;
  final void Function(Skill)? onClickDeleteItem;
  final void Function(Skill)? onToggleCompleteItem;
  final ReorderCallback onReorder;

  const ProfilePage({
    super.key,
    required this.profile,
    required this.skills,
    required this.onClickAddItem,
    required this.onClickDeleteItem,
    required this.onToggleCompleteItem,
    required this.onReorder,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s16),
            child: ResponsiveColumnLayout(
              startContent: ProfileCard(
                profile: widget.profile,
              ),
              endContent: ReorderableListView.builder(
                shrinkWrap: true,
                itemCount: widget.skills?.length ?? 0,
                itemBuilder: (context, index) {
                  var skill = widget.skills![index];
                  return SkillListTile(
                    key: ValueKey(skill),
                    skill: skill,
                    onClickDelete: () => widget.onClickDeleteItem!(skill),
                    onToggleComplete: () => widget.onToggleCompleteItem!(skill),
                  );
                },
                onReorder: widget.onReorder,
              ),
              spacing: Spacing.s16,
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        iconPath: Asset.pinIcon,
        onPressed: widget.onClickAddItem!,
      ),
    );
  }
}
