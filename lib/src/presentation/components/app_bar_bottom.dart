import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/search_bar.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final void Function(String) onChanged;
  final VoidCallback onPressed;

  const CustomAppBarBottom({
    super.key,
    required this.onChanged,
    required this.onPressed,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.kBackgrounSubtleColor,
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.s16,
        vertical: Spacing.s4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: CustomSearchBar(
              onChanged: onChanged,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
