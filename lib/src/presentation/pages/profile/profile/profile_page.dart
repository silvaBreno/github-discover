import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/mock/profile_mock.dart';
import 'package:github_discover/src/constants/mock/skill_mock.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/floating_action_button.dart';
import 'package:github_discover/src/presentation/components/responsive_column_layout.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/profile_card.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/skill_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    Skills skills = kSkillsMock;

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
              startContent: const ProfileCard(
                profile: kProfileMock,
              ),
              endContent: ReorderableListView.builder(
                shrinkWrap: true,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return SkillListTile(
                    key: ValueKey(skills[index]),
                    skill: skills[index],
                    onClickDelete: () {},
                    onToggleComplete: () {},
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Skill item = skills.removeAt(oldIndex);
                    skills.insert(newIndex, item);
                  });
                },
              ),
              spacing: Spacing.s16,
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        iconPath: Asset.pinIcon,
        onPressed: () {},
      ),
    );
  }
}
