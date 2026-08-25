import 'package:calculator/utils/theme/custom_themes/theme_appbar.dart';
import 'package:calculator/utils/theme/custom_themes/theme_elevated_button.dart';
import 'package:calculator/utils/theme/custom_themes/theme_text.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(surfaceContainerHighest: Colors.white),
    elevatedButtonTheme: ThemeElevatedButton.lightTheme,
    textTheme: ThemeText.lightTheme,
    appBarTheme: ThemeAppbar.lightTheme,
    extensions: [
      ThemeElevatedButton(
        numberButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        operatorButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    ],
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(surfaceContainerHighest: Colors.black),
    elevatedButtonTheme: ThemeElevatedButton.darkTheme,
    textTheme: ThemeText.darkTheme,
    appBarTheme: ThemeAppbar.darkTheme,
    extensions: [
      ThemeElevatedButton(
        numberButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        operatorButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    ],
  );
}
