import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppDarkColors.primary,
  primaryColor: AppDarkColors.primary[500],
  primaryColorBrightness: Brightness.light,
  accentColor: AppDarkColors.primary[700],
  accentColorBrightness: Brightness.light,
  secondaryHeaderColor: AppDarkColors.primary[700],
  fontFamily: GoogleFonts.raleway().fontFamily,
);

class AppDarkColors {
  AppDarkColors._();

  static const _primaryColor = 0xFF000000;

  static const MaterialColor primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      100: Color(0xFFF2F2F2),
      200: Color(0xFFE5E5E5),
      300: Color(0xFFB2B2B2),
      400: Color(0xFF666666),
      500: Color(_primaryColor),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
}
