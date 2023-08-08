import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/breakpoints.dart';

class ResponsiveColumnLayout extends StatelessWidget {
  final Widget startContent;
  final Widget endContent;
  final double spacing;
  final int startFlex;
  final int endFlex;
  final double breakpoint;

  const ResponsiveColumnLayout({
    super.key,
    required this.startContent,
    required this.endContent,
    required this.spacing,
    this.startFlex = 2,
    this.endFlex = 3,
    this.breakpoint = Breakpoint.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= breakpoint) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(flex: startFlex, child: startContent),
              SizedBox(width: spacing),
              Flexible(flex: endFlex, child: endContent),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              startContent,
              SizedBox(height: spacing),
              endContent,
            ],
          );
        }
      },
    );
  }
}
