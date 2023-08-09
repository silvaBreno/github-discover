import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/text.dart';

class RepositoryItem extends StatelessWidget {
  final String? label;
  final String? text;

  const RepositoryItem({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: label,
          style: TypographyType.label,
        ),
        CustomText(
          text: text,
          textAlign: TextAlign.center,
          style: TypographyType.body,
          wrap: false,
        ),
      ],
    );
  }
}
