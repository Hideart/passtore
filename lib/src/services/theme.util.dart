import 'package:flutter/material.dart';

class AppTheme {
  final AvailableTheme name;
  final Color textPrimary;
  final Color primaryColor;
  final Color accentColor;
  final Color secondaryColor;
  final Color accentSecondaryColor;

  const AppTheme({
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.accentSecondaryColor,
    required this.textPrimary,
  });
}

enum AvailableTheme { main }

extension ParseToString on AvailableTheme {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
