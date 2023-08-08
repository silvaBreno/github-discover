import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

enum InputType { neutral, error }

class BaseInputData {
  final Color color;
  final InputDecoration inputDecoration;
  final FormFieldState formFieldState;
  final FocusNode focusNode;

  const BaseInputData(
    this.color,
    this.inputDecoration,
    this.formFieldState,
    this.focusNode,
  );
}

class BaseInput extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final bool focused;
  final InputType inputType;
  final dynamic initialValue;
  final void Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;
  final Widget Function(BaseInputData data) builder;
  final void Function(FocusNode node, bool focused)? onFocusChange;

  const BaseInput({
    required this.inputType,
    required this.builder,
    this.labelText,
    this.helperText,
    this.errorText,
    this.onSaved,
    this.validator,
    this.onFocusChange,
    this.initialValue,
    this.enabled = true,
    this.focused = false,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      enabled: widget.enabled,
      onSaved: widget.onSaved,
      validator: widget.validator,
      initialValue: widget.initialValue,
      builder: (formFieldState) {
        final isValid = formFieldState.errorText == null;
        final style = _BaseInputStyle.build(
          context,
          widget.labelText,
          widget.helperText,
          widget.errorText,
          widget.enabled,
          widget.focused,
          isValid ? widget.inputType : InputType.error,
        );

        return Focus(
          onFocusChange: (value) =>
              widget.onFocusChange?.call(_focusNode, value),
          child: widget.builder(
            BaseInputData(
              style.color,
              style.decoration,
              formFieldState,
              _focusNode,
            ),
          ),
        );
      },
    );
  }
}

class _BaseInputStyle {
  final BuildContext context;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Color color;
  final Color fillColor;
  final bool enabled;
  final bool focused;
  final InputBorder border;
  final InputType state;

  const _BaseInputStyle(
    this.context,
    this.labelText,
    this.helperText,
    this.errorText,
    this.color,
    this.fillColor,
    this.enabled,
    this.focused,
    this.border,
    this.state,
  );

  factory _BaseInputStyle.build(
    BuildContext context,
    String? labelText,
    String? helperText,
    String? errorText,
    bool enabled,
    bool focused,
    InputType state,
  ) {
    final InputBorder border;
    final Color color;
    final Color fillColor;

    switch (state) {
      case InputType.error:
        border = inputBorder(context.colors.kAlertDangerColor);
        color = context.colors.kForegroundColor;
        fillColor = enabled
            ? context.colors.kAlertDangerColor.withAlpha(10)
            : context.colors.kAlertDangerColor;
        break;
      default:
        border = inputBorder(context.colors.kNeutralColor);
        color = context.colors.kForegroundColor;
        fillColor = context.colors.kWhiteColor;
        break;
    }

    return _BaseInputStyle(
      context,
      labelText,
      helperText,
      errorText,
      color,
      fillColor,
      enabled,
      focused,
      border,
      state,
    );
  }

  InputDecoration get decoration => InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: typography[TypographyType.label]?.copyWith(
          color: color,
          fontSize: 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        helperText: helperText,
        helperStyle: typography[TypographyType.label]?.copyWith(color: color),
        helperMaxLines: 2,
        errorText: errorText,
        errorStyle: typography[TypographyType.label]?.copyWith(color: color),
        errorMaxLines: 2,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacing.s8,
          vertical: Spacing.s16,
        ),
        filled: true,
        fillColor: fillColor,
        errorBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        border: border,
        enabled: enabled,
      );
}
