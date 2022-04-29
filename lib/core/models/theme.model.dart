import 'package:flutter/material.dart';

class AppTheme {
  final AvailableTheme name;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color primaryColor;
  final Color accentColor;
  final Color secondaryColor;
  final Color accentSecondaryColor;
  final Color darkBackgroundColor;

  const AppTheme({
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.accentSecondaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.darkBackgroundColor,
  });
}

enum AvailableTheme { main, dark }

extension ParseToString on AvailableTheme {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
