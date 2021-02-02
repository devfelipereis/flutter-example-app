import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: AppLightColors.primary,
  primaryColor: AppLightColors.primary[500],
  primaryColorBrightness: Brightness.light,
  accentColor: AppLightColors.primary[700],
  accentColorBrightness: Brightness.light,
  secondaryHeaderColor: AppLightColors.primary[700],
  fontFamily: GoogleFonts.raleway().fontFamily,
  backgroundColor: Colors.transparent,
  canvasColor: Colors.white,
);

class AppLightColors {
  AppLightColors._();

  static const _blackPrimaryValue = 0xFF000000;

  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      100: Color(0xFFF2F2F2),
      200: Color(0xFFE5E5E5),
      300: Color(0xFFB2B2B2),
      400: Color(0xFF666666),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  static const _primaryColor = 0xFF0FB550;

  static const MaterialColor primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      100: Color(0xFFCDFBCD),
      200: Color(0xFF9CF7A5),
      300: Color(0xFF68E881),
      400: Color(0xFF41D26C),
      500: Color(_primaryColor),
      600: Color(0xFF0A9B51),
      700: Color(0xFF078250),
      800: Color(0xFF046849),
      900: Color(0xFF025645),
    },
  );

  static const _successColor = 0xFF0ADB81;

  static const MaterialColor success = MaterialColor(
    _successColor,
    <int, Color>{
      100: Color(0xFFCCFDD5),
      200: Color(0xFF9BFBB5),
      300: Color(0xFF68F49C),
      400: Color(0xFF42E990),
      500: Color(_successColor),
      600: Color(0xFF07BC80),
      700: Color(0xFF059D7A),
      800: Color(0xFF037F6E),
      900: Color(0xFF016965),
    },
  );

  static const _infoColor = 0xFF1760E8;

  static const MaterialColor info = MaterialColor(
    _infoColor,
    <int, Color>{
      100: Color(0xFFD0E6FD),
      200: Color(0xFFA1CBFC),
      300: Color(0xFF71AAF8),
      400: Color(0xFF4E8CF1),
      500: Color(_infoColor),
      600: Color(0xFF104AC7),
      700: Color(0xFF0B36A7),
      800: Color(0xFF072686),
      900: Color(0xFF041A6F),
    },
  );

  static const _warningColor = 0xFFFCE811;

  static const MaterialColor warning = MaterialColor(
    _warningColor,
    <int, Color>{
      100: Color(0xFFFEFCCF),
      200: Color(0xFFFEF99F),
      300: Color(0xFFFEF46F),
      400: Color(0xFFFDEF4C),
      500: Color(_warningColor),
      600: Color(0xFFD8C50C),
      700: Color(0xFFB5A308),
      800: Color(0xFF928205),
      900: Color(0xFF786A03),
    },
  );

  static const _dangerColor = 0xFFFF4830;

  static const MaterialColor danger = MaterialColor(
    _dangerColor,
    <int, Color>{
      100: Color(0xFFFFE7D5),
      200: Color(0xFFFFC9AC),
      300: Color(0xFFFFA582),
      400: Color(0xFFFF8263),
      500: Color(_dangerColor),
      600: Color(0xFFDB2923),
      700: Color(0xFFB7181F),
      800: Color(0xFF930F1F),
      900: Color(0xFF7A0920),
    },
  );
}
