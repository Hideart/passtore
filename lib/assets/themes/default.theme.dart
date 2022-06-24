import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passtore/core/models/models.dart';

AppTheme lightTheme = const AppTheme(
  name: AvailableTheme.LIGHT,
  brightness: Brightness.light,
  accentColor: Color(0xFFCBFFD4),
  accentSecondaryColor: Color(0xFF00E6C7),
  primaryColor: Colors.white,
  secondaryColor: Color(0xFFCACACA),
  darkBackgroundColor: Color(0xFFE9E9E9),
  textPrimaryColor: Color(0xFF3F3F3F),
  textSecondaryColor: Color(0xFF6E6E6E),
  textPaleColor: Color(0xFFA3A3A3),
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

ThemeData lightThemeData = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  extensions: <ThemeExtension<AppTheme>>[lightTheme],
);
