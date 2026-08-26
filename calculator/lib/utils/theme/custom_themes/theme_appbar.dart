import 'package:calculator/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ThemeAppbar {
  ThemeAppbar._();

  static AppBarTheme lightTheme = AppBarTheme(
    backgroundColor: AppColors.appButtonLight,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontFamily: 'Montono',
      fontWeight: FontWeight.bold,
    ),
  );

  static AppBarTheme darkTheme = AppBarTheme(
    backgroundColor: AppColors.appButtonDark,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontFamily: 'Montono',
      fontWeight: FontWeight.bold,
    ),
  );
}
