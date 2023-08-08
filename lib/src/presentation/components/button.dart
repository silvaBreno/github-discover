import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isDisabled
                ? context.colors.kNeutralColor
                : context.colors.kAccentColor,
          ),
          shape: MaterialStateProperty.all(shapeBorder(
            isDisabled
                ? context.colors.kNeutralColor
                : context.colors.kAccentColor,
          )),
          side: MaterialStateProperty.all(
            BorderSide(
              width: borderWidth,
              color: isDisabled
                  ? context.colors.kNeutralColor
                  : context.colors.kAccentColor,
            ),
          ),
        ),
        child: _getButtonContent(context.colors.kWhiteColor),
      ),
    );
  }

  Widget _getButtonContent(Color contentColor) {
    return SizedBox(
      height: Spacing.s44,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            color: contentColor,
            style: TypographyType.body,
            text: label.toUpperCase(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
