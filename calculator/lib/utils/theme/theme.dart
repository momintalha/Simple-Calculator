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
      surfaceContainerHighest: AppColors.displayPanelDark,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      ThemeText(
        numberButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.numberButtonLabelDark,
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        operatorButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.operatorButtonLabelDark,
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surfaceContainerHighest: AppColors.displayPanelLight,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),
      ThemeText(
        numberButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.numberButtonLabelLight,
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
        operatorButtonTextTheme: TextTheme(
          labelSmall: TextStyle(
            color: AppColors.operatorButtonLabelDark,
            fontSize: 18,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    ],
  );
}
