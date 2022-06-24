import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passtore/core/models/models.dart';

AppTheme darkTheme = const AppTheme(
  name: AvailableTheme.DARK,
  brightness: Brightness.dark,
  accentColor: Color(0xFF00A58E),
  accentSecondaryColor: Color(0xFF8AD8A9),
  primaryColor: Color(0xFF24252A),
  secondaryColor: Color(0xFF444444),
  darkBackgroundColor: Color(0xFF1C1D21),
  textPrimaryColor: Color(0xFFFFFFFF),
  textSecondaryColor: Color(0xFFCCCCCC),
  textPaleColor: Color(0xFF797979),
  buttons: AppButtonTheme(
    primaryBackground: Color(0xFF00E6C7),
    secondaryBackground: Color(0xFFD8D8D8),
    disabledBackground: Color(0xFFA3A3A3),
    rejectBackground: Color(0xFFD24949),
    approveBackground: Color(0xFF49D284),
    primarySplashColor: Color(0xFF009682),
    secondarySplashColor: Color(0xFF6E6E6E),
    disabledSplashColor: Color(0xFF6E6E6E),
    rejectSplashColor: Color(0xFFF54F4F),
    approveSplashColor: Color(0xFF00E6C7),
    primaryTextColor: Colors.white,
    secondaryTextColor: Color(0xFF3F3F3F),
    disabledTextColor: Color(0xFF6E6E6E),
    rejectTextColor: Colors.white,
    approveTextColor: Colors.white,
  ),
);

ThemeData darkThemeData = ThemeData.dark().copyWith(
  appBarTheme:
      const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
  extensions: <ThemeExtension<AppTheme>>[darkTheme],
);
