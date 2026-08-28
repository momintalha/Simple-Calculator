import 'package:flutter/material.dart';

class ThemeElevatedButton extends ThemeExtension<ThemeElevatedButton> {
  final ButtonStyle numberButtonStyle;
  final ButtonStyle operatorButtonStyle;

  const ThemeElevatedButton({
    required this.numberButtonStyle,
    required this.operatorButtonStyle,
  });

  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconSize: 16,
      iconColor: Colors.black,
      backgroundColor: Colors.white,
      shadowColor: Colors.black45,
      shape: CircleBorder(),
      elevation: 2,
    ),
  );

  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconSize: 16,
      iconColor: Colors.white,
      backgroundColor: Color(0xFF16253D),
      shadowColor: Colors.white,
      shape: CircleBorder(),
      elevation: 2,
    ),
  );

  @override
  ThemeElevatedButton copyWith({
    ButtonStyle? numberButtonStyle,
    ButtonStyle? operatorButtonStyle,
  }) {
    return ThemeElevatedButton(
      numberButtonStyle: numberButtonStyle ?? this.numberButtonStyle,
      operatorButtonStyle: operatorButtonStyle ?? this.operatorButtonStyle,
    );
  }

  @override
  ThemeExtension<ThemeElevatedButton> lerp(
    covariant ThemeExtension<ThemeElevatedButton>? other,
    double t,
  ) {
    return this;
  }
}
