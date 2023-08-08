import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final void Function(bool)? onChanged;

  const CustomCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged ?? widget.onChanged!(!isChecked);
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 50),
        opacity: 1.0,
        curve: Curves.easeIn,
        child: CustomIcon(
          iconPath: isChecked ? Asset.squareFillIcon : Asset.squareIcon,
          color: isChecked
              ? context.colors.kForegroundColor
              : context.colors.kForegroundColor,
        ),
      ),
    );
  }
}
