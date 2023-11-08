import 'package:flutter/material.dart';

class TextThemeApp {
  static TextTheme theme(ColorScheme type) {
    return TextTheme(
      displayMedium: TextStyle(
        color: type.onBackground,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      ),
      displaySmall: TextStyle(
        color: type.onBackground,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      //
      headlineMedium: TextStyle(
        color: type.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      ),

      headlineSmall: TextStyle(
        color: type.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      ),

      titleLarge: TextStyle(
        color: type.onBackground,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cond',
      ),
      titleMedium: TextStyle(
        color: type.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Cond',
      ),
      titleSmall: TextStyle(
        color: type.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cond',
      ),

      labelLarge: TextStyle(
        color: type.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cond',
      ),
      labelMedium: TextStyle(
        color: type.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'LCG',
      ),
      labelSmall: TextStyle(
        color: type.onBackground,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'SixInch',
      ),

      bodyLarge: TextStyle(
        color: type.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'LCG',
      ),
      bodyMedium: TextStyle(
        color: type.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'LCG',
      ),
      bodySmall: TextStyle(
        color: type.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'LCG',
      ),
    );
  }
}
