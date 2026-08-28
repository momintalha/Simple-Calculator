import 'package:calculator/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ThemeText extends ThemeExtension<ThemeText> {
  final TextTheme numberButtonTextTheme;
  final TextTheme operatorButtonTextTheme;

  ThemeText({
    required this.numberButtonTextTheme,
    required this.operatorButtonTextTheme,
  });

  static TextTheme lightTheme = TextTheme(
    bodySmall: TextStyle(
      color: Colors.black38,
      fontSize: 22,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      color: Colors.black54,
      fontSize: 30,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 44,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w600,
    ),
  );

  static TextTheme darkTheme = TextTheme(
    bodySmall: TextStyle(
      color: Colors.white38,
      fontSize: 22,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      color: Colors.white38,
      fontSize: 30,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 44,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  ThemeText copyWith({
    TextTheme? numberButtonTextTheme,
    TextTheme? operatorButtonTextTheme,
  }) {
    return ThemeText(
      numberButtonTextTheme:
          numberButtonTextTheme ?? this.numberButtonTextTheme,
      operatorButtonTextTheme:
          operatorButtonTextTheme ?? this.operatorButtonTextTheme,
    );
  }

  @override
  ThemeExtension<ThemeText> lerp(
    covariant ThemeExtension<ThemeText>? other,
    double t,
  ) {
    return this;
  }
}
