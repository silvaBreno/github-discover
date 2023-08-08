import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoActivityIndicator(
              color: context.colors.kAccentColor,
              radius: Spacing.s48,
            )
          : SizedBox.square(
              dimension: Spacing.s48,
              child: CircularProgressIndicator(
                color: context.colors.kAccentColor,
                strokeWidth: Spacing.s4,
              ),
            ),
    );
  }
}
