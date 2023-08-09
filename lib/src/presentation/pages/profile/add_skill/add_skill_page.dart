import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/add_skill_form.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class AddSkillPage extends StatefulWidget {
  const AddSkillPage({super.key});

  @override
  State<AddSkillPage> createState() => _AddSkillPageState();
}

class _AddSkillPageState extends State<AddSkillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(text: context.locales.skillAppBar),
      extendBodyBehindAppBar: true,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Spacing.s16),
          child: AddSkillForm(),
        ),
      ),
    );
  }
}
