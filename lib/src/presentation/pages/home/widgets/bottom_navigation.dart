import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentPage;
  final void Function(int index) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentPage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      selectedLabelStyle: typography[TypographyType.label],
      selectedItemColor: context.colors.kAccentColor,
      unselectedLabelStyle: typography[TypographyType.caption],
      unselectedItemColor: context.colors.kForegroundColor,
      backgroundColor: context.colors.kBackgrounSubtleColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
      iconSize: Spacing.s20,
      items: items,
      onTap: onTap,
    );
  }
}
