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
      fontSize: 24,
      fontFamily: 'Montono',
    ),
    displaySmall: TextStyle(
      color: Colors.black54,
      fontSize: 28,
      fontFamily: 'Montono',
    ),
    displayMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 48,
      fontFamily: 'Montono',
    ),
  );

  static TextTheme darkTheme = TextTheme(
    bodySmall: TextStyle(
      color: Colors.white38,
      fontSize: 24,
      fontFamily: 'Montono',
    ),
    displaySmall: TextStyle(
      color: Colors.white38,
      fontSize: 28,
      fontFamily: 'Montono',
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 48,
      fontFamily: 'Montono',
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
