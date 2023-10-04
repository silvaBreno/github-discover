import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/button.dart';
import 'package:github_discover/src/presentation/components/inputs/multiline.dart';
import 'package:github_discover/src/presentation/components/inputs/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/helpers/form_fields_validator.dart';

class AddSkillForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final VoidCallback onAddSkillPressed;

  const AddSkillForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onAddSkillPressed,
  });

  @override
  State<AddSkillForm> createState() => _AddSkillFormState();
}

class _AddSkillFormState extends State<AddSkillForm> {
  final _formKey = GlobalKey<FormState>();
  bool _disableButton = true;

  @override
  void initState() {
    super.initState();
    widget.titleController.addListener(verifyForm);
    widget.descriptionController.addListener(verifyForm);
  }

  verifyForm() {
    if (widget.titleController.text.trim().isNotEmpty &&
        widget.descriptionController.text.trim().isNotEmpty) {
      setState(() => _disableButton = false);
    } else {
      setState(() => _disableButton = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextInput(
            labelText: context.locales.skillTitleLabel,
            editingController: widget.titleController,
            maxLines: 1,
            maxLength: 50,
            inputAction: TextInputAction.next,
            validator: (text) {
              return titleFieldValidator(context, text);
            },
          ),
          const SizedBox(height: Spacing.s16),
          CustomMultilineInput(
            labelText: context.locales.skillDescriptionLabel,
            editingController: widget.descriptionController,
            maxLines: 3,
            maxLength: 200,
            inputAction: TextInputAction.done,
            validator: (text) {
              return descriptionFieldValidator(context, text);
            },
          ),
          const SizedBox(height: Spacing.s24),
          CustomButton(
            label: context.locales.addSkillButton,
            isDisabled: _disableButton,
            onPressed: widget.onAddSkillPressed,
          ),
        ],
      ),
    );
  }
}
