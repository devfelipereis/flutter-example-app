import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

// final themeDataProvider = RM.inject<ThemeData>(() => lightThemeData);

enum AppTheme {
  appDefault,
}

final InjectedTheme theme = RM.injectTheme<AppTheme>(
  //The first theme in lightThemes is the default one,
  lightThemes: {
    AppTheme.appDefault: lightThemeData,
  },
  darkThemes: {
    AppTheme.appDefault: darkThemeData,
  },
  persistKey: '__theme__',
);
