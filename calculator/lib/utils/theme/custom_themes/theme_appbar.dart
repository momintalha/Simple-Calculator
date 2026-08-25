import 'package:flutter/material.dart';

class ThemeAppbar {
  ThemeAppbar._();

  static AppBarTheme lightTheme = AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: 'Montono',
      fontWeight: FontWeight.bold,
    ),
  );

  static AppBarTheme darkTheme = AppBarTheme(
    backgroundColor: Colors.blue,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Montono',
      fontWeight: FontWeight.bold,
    ),
  );
}
