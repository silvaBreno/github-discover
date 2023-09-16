import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/logo.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? text;
  final bool hasBackButton;
  final VoidCallback? backButtonPressed;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    super.key,
    this.text,
    this.backButtonPressed,
    this.hasBackButton = false,
    this.bottom,
  }) : preferredSize = Size.fromHeight(
            bottom == null ? kToolbarHeight : kToolbarHeight * 2.5);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.colors.kBackgrounSubtleColor,
      centerTitle: true,
      elevation: Spacing.s0,
      surfaceTintColor: Colors.transparent,
      bottom: widget.bottom,
      leading: widget.hasBackButton
          ? GestureDetector(
              onTap: widget.backButtonPressed,
              child: const CustomIcon(
                iconPath: Asset.arrowLeftIcon,
              ),
            )
          : Container(),
      title: widget.text == null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLogo(
                  pathDark: Logo.logoWhite,
                  pathLight: Logo.logo,
                  height: kToolbarHeight,
                ),
                CustomText(
                  text: context.locales.discoverAppBar,
                  color: context.colors.kForegroundColor,
                  style: TypographyType.title,
                ),
              ],
            )
          : CustomText(
              text: widget.text!,
              color: context.colors.kForegroundColor,
              style: TypographyType.title,
            ),
    );
  }
}
