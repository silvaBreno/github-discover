import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/presentation/components/button.dart';
import 'package:github_discover/src/presentation/components/inputs/search.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function(String) onChanged;
  final VoidCallback onPressed;

  const CustomSearchBar({
    super.key,
    required this.onChanged,
    required this.onPressed,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.kBackgrounSubtleColor,
      padding: const EdgeInsets.all(Spacing.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
            child: CustomSearchInput(),
          ),
          const SizedBox(width: Spacing.s4),
          CustomButton(
            label: context.locales.searchButton,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
