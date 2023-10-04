import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/pages/profile/widgets/add_skill_form.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class AddSkillDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onAddSkillPressed;

  const AddSkillDialog({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onAddSkillPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: borderDialog(context.colors.kBackgrounDefaultColor),
        padding: const EdgeInsets.all(Spacing.s24),
        child: AddSkillForm(
          titleController: titleController,
          descriptionController: descriptionController,
          onAddSkillPressed: onAddSkillPressed,
        ),
      ),
    );
  }
}

Future<void> showAddSkillDialog(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required VoidCallback onAddSkillPressed,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: context.colors.kBackgrounDefaultColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    isScrollControlled: true,
    builder: (context) {
      return AddSkillDialog(
        titleController: titleController,
        descriptionController: descriptionController,
        onAddSkillPressed: onAddSkillPressed,
      );
    },
  );
}
