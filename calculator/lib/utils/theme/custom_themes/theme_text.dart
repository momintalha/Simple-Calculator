import 'package:flutter/material.dart';

class ThemeText {
  ThemeText._();

  static TextTheme lightTheme = TextTheme(
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w900,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
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
}
