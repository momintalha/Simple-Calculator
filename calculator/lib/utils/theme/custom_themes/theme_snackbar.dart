import 'package:flutter/material.dart';

class ThemeSnackbar {
  ThemeSnackbar._();

  static SnackBarThemeData lightTheme = SnackBarThemeData(
    backgroundColor: Colors.black,
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Inter',
      fontSize: 14,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    actionTextColor: Colors.blueAccent,
    elevation: 4,
  );

  static const SnackBarThemeData darkTheme = SnackBarThemeData(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Montono',
    ),
  );
}
