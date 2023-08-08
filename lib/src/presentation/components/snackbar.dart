import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

enum SnackBarType { success, error, warning, info }

class CustomSnackBar {
  static SnackBar _buildSnackbar({
    BuildContext? context,
    String? text,
    SnackBarType? type,
  }) {
    Color? baseColor;
    String? path;

    switch (type) {
      case SnackBarType.success:
        baseColor = context!.colors.kAlertSuccessColor;
        path = Asset.circleCheckIcon;
        break;
      case SnackBarType.error:
        baseColor = context!.colors.kAlertDangerColor;
        path = Asset.stopIcon;
        break;
      case SnackBarType.warning:
        baseColor = context!.colors.kAlertAttentionColor;
        path = Asset.alertIcon;
        break;
      case SnackBarType.info:
        baseColor = context!.colors.kAccentColor;
        path = Asset.infoIcon;
        break;
      default:
        break;
    }

    return SnackBar(
      backgroundColor: baseColor,
      behavior: SnackBarBehavior.floating,
      elevation: Spacing.s8,
      shape: shapeBorder(baseColor!),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: CustomIcon(
              iconPath: path!,
              color: context!.colors.kWhiteColor,
            ),
          ),
          const SizedBox(width: Spacing.s16),
          Expanded(
            child: CustomText(
              color: context.colors.kWhiteColor,
              style: TypographyType.body,
              text: text!,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    String text = 'Action successful!',
    SnackBarType type = SnackBarType.success,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackbar(context: context, text: text, type: type),
    );
  }
}
