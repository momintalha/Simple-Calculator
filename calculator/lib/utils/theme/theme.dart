import 'package:calculator/utils/constants/colors.dart';
import 'package:calculator/utils/theme/custom_themes/theme_appbar.dart';
import 'package:calculator/utils/theme/custom_themes/theme_elevated_button.dart';
import 'package:calculator/utils/theme/custom_themes/theme_text.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.black12,
      primaryContainer: AppColors.backgroundLight,
      surfaceContainerHighest: AppColors.displayPanelLight,
    ),
    elevatedButtonTheme: ThemeElevatedButton.lightTheme,
    textTheme: ThemeText.lightTheme,
    appBarTheme: ThemeAppbar.lightTheme,
    extensions: [
      ThemeElevatedButton(
        numberButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.numberButtonLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        operatorButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.operatorButtonLight,
          shadowColor: Color(0xffe8f6f6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      ThemeText(
        numberButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.numberButtonLabelDark,
            fontSize: 22,
            fontFamily: 'Nunito',
          ),
        ),
        operatorButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.operatorButtonLabelDark,
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.white38,
      primaryContainer: AppColors.backgroundDark,
      surfaceContainerHighest: AppColors.displayPanelDark,
    ),
    elevatedButtonTheme: ThemeElevatedButton.darkTheme,
    textTheme: ThemeText.darkTheme,
    appBarTheme: ThemeAppbar.darkTheme,
    extensions: [
      ThemeElevatedButton(
        numberButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.numberButtonDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        operatorButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: AppColors.operatorButtonDark,
          shadowColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      ThemeText(
        numberButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.numberButtonLabelLight,
            fontSize: 22,
            fontFamily: 'Nunito',
          ),
        ),
        operatorButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.operatorButtonLabelDark,
            fontSize: 20,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    ],
  );
}
