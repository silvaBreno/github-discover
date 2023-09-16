import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: Spacing.s48,
        child: CircularProgressIndicator(
          color: context.colors.kAccentColor,
          strokeWidth: Spacing.s4,
        ),
      ),
    );
  }
}
