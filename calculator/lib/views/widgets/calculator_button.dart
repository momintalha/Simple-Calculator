import 'package:calculator/utils/theme/custom_themes/theme_elevated_button.dart';
import 'package:calculator/utils/theme/custom_themes/theme_text.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final bool buttonType;
  final VoidCallback onTap;
  final VoidCallback? onLongTap;

  const CalcButton({
    super.key,
    required this.label,
    required this.onTap,
    this.onLongTap,
    this.buttonType = true,
  });

  @override
  Widget build(BuildContext context) {
    final calcButtonStyle = Theme.of(context).extension<ThemeElevatedButton>()!;
    final calcButtonTextTheme = Theme.of(context).extension<ThemeText>()!;

    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      onLongPress: () {
        if (onLongTap != null) onLongTap!();
      },
      style: (buttonType)
          ? calcButtonStyle.numberButtonStyle
          : calcButtonStyle.operatorButtonStyle,
      child: Text(
        label,
        style: (buttonType)
            ? calcButtonTextTheme.numberButtonTextTheme.labelSmall
            : calcButtonTextTheme.operatorButtonTextTheme.labelSmall,
      ),
    );
  }
}
