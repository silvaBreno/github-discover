import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/button.dart';
import 'package:github_discover/src/presentation/components/inputs/multiline.dart';
import 'package:github_discover/src/presentation/components/inputs/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/helpers/form_fields_validator.dart';

class AddSkillForm extends StatefulWidget {
  const AddSkillForm({super.key});

  @override
  State<AddSkillForm> createState() => _AddSkillFormState();
}

class _AddSkillFormState extends State<AddSkillForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          CustomTextInput(
            labelText: context.locales.skillTitleLabel,
            editingController: _titleController,
            maxLines: 1,
            maxLength: 50,
            validator: (text) {
              return titleFieldValidator(context, text);
            },
          ),
          const SizedBox(height: Spacing.s16),
          CustomMultilineInput(
            labelText: context.locales.skillDescriptionLabel,
            editingController: _descriptionController,
            maxLines: 3,
            maxLength: 200,
            validator: (text) {
              return descriptionFieldValidator(context, text);
            },
          ),
          const SizedBox(height: Spacing.s24),
          CustomButton(
            label: context.locales.addSkillButton,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
