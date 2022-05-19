import 'package:flutter/material.dart';

class AppButtonTheme {
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color disabledBackground;
  final Color rejectBackground;
  final Color approveBackground;

  final Color primarySplashColor;
  final Color secondarySplashColor;
  final Color disabledSplashColor;
  final Color rejectSplashColor;
  final Color approveSplashColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color disabledTextColor;
  final Color rejectTextColor;
  final Color approveTextColor;

  const AppButtonTheme({
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.disabledBackground,
    required this.rejectBackground,
    required this.approveBackground,
    required this.primarySplashColor,
    required this.secondarySplashColor,
    required this.disabledSplashColor,
    required this.rejectSplashColor,
    required this.approveSplashColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.disabledTextColor,
    required this.rejectTextColor,
    required this.approveTextColor,
  });
}

class AppTheme extends ThemeExtension<AppTheme> {
  final AvailableTheme name;
  final Brightness brightness;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color textPaleColor;
  final Color primaryColor;
  final Color accentColor;
  final Color secondaryColor;
  final Color accentSecondaryColor;
  final Color darkBackgroundColor;
  final AppButtonTheme buttons;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.accentSecondaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.textPaleColor,
    required this.darkBackgroundColor,
    required this.buttons,
  });

  @override
  AppTheme copyWith() {
    return this;
  }

  @override
  AppTheme lerp(ThemeExtension<AppTheme>? other, double t) {
    return this;
  }

  // Optional
  @override
  String toString() => 'AppTheme(name: $name)';
}

enum AvailableTheme {
  LIGHT('Light'),
  DARK('Dark');

  final String themeName;
  const AvailableTheme(this.themeName);

  @override
  String toString() => this.themeName;
}
