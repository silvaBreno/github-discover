import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String iconPath;
  final bool isDisabled;
  final Function() onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.iconPath,
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
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              width: borderWidth,
              color: isDisabled
                  ? context.colors.kForegroundColor
                  : context.colors.kWhiteColor,
            ),
          ),
        ),
        child: _getButtonContent(context.colors.kWhiteColor),
      ),
    );
  }

  Widget _getButtonContent(Color contentColor) {
    return SizedBox(
      height: Spacing.s56,
      child: SizedBox(
        child: CustomIcon(
          iconPath: iconPath,
          color: contentColor,
        ),
      ),
    );
  }
}
