import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/inputs/base.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomSearchInput extends StatefulWidget {
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final InputType inputType;
  final TextEditingController? editingController;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;

  const CustomSearchInput({
    super.key,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.inputType = InputType.neutral,
    this.editingController,
    this.inputAction,
    this.inputFormatters,
    this.textInputType,
    this.onSaved,
    this.validator,
  });

  @override
  State<CustomSearchInput> createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  late TextEditingController textEditingController;
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    hasFocus = false;
    textEditingController = widget.editingController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      helperText: widget.helperText,
      errorText: widget.errorText,
      inputType: widget.inputType,
      enabled: widget.enabled,
      focused: hasFocus,
      onFocusChange: _onFocusChange,
      onSaved: (value) => widget.onSaved?.call(value),
      validator: (value) => widget.validator?.call(value),
      builder: (BaseInputData data) {
        return TextField(
          focusNode: data.focusNode,
          controller: textEditingController,
          cursorColor: context.colors.kAccentColor,
          keyboardType: widget.textInputType,
          textInputAction: widget.inputAction,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          onChanged: (value) => data.formFieldState.didChange(value),
          style: typography[TypographyType.body]
              ?.copyWith(color: context.colors.kForegroundColor),
          decoration: data.inputDecoration.copyWith(
            prefixIcon: _getPrefixIconByState(data.color),
            suffixIcon: _getSuffixIconByState(data.color),
          ),
        );
      },
    );
  }

  Widget? _getPrefixIconByState(Color color) {
    switch (widget.inputType) {
      case InputType.error:
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.s8,
            horizontal: Spacing.s16,
          ),
          child: CustomIcon(
            iconPath: Asset.searchIcon,
            color: color,
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.s8,
            horizontal: Spacing.s16,
          ),
          child: CustomIcon(
            iconPath: Asset.searchIcon,
            color: color,
          ),
        );
    }
  }

  Widget? _getSuffixIconByState(Color color) {
    switch (widget.inputType) {
      case InputType.error:
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.s8,
            horizontal: Spacing.s16,
          ),
          child: CustomIcon(
            iconPath: Asset.xIcon,
            color: color,
          ),
        );
      default:
        return null;
    }
  }

  void _onFocusChange(FocusNode node, bool focus) {
    setState(() {
      hasFocus = focus;
      if (hasFocus) node.requestFocus();
    });
  }
}
