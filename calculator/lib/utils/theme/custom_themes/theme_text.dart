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
    labelSmall: TextStyle(
      color: AppColors.textDark,
      fontSize: 18,
      fontFamily: 'Nunito',
    ),
    displayMedium: TextStyle(
      color: AppColors.textDark,
      fontSize: 40,
      fontFamily: 'Nunito',
    ),
  );

  static TextTheme darkTheme = TextTheme(
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'Nunito',
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontFamily: 'Nunito',
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
