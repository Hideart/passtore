import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/core/extensions/extensions.dart';
import 'package:passtore/assets/themes/themes.dart';

class ThemeCubit extends HydratedCubit<AppTheme> {
  ThemeCubit([AppTheme? initialState]) : super(initialState ?? defaultTheme);

  final List<AppTheme> _themes = [defaultTheme, darkTheme];

  void changeTheme(AvailableTheme themeName) {
    final AppTheme? theme = this._themes.find((th) => th.name == themeName);
    if (theme != null) {
      return emit(theme);
    }
    return emit(state);
  }

  @override
  AppTheme? fromJson(Map<String, dynamic> json) {
    final String? themeName = json['currentTheme'] as String?;
    final currentTheme = this._themes.find((th) {
      var th2 = th;
      return th2.name.toShortString() == themeName;
    });
    if (currentTheme != null) {
      return currentTheme;
    }
    return null;
  }

  @override
  Map<String, String> toJson(AppTheme state) {
    return {'currentTheme': state.name.toShortString()};
  }
}

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

enum AvailableTheme { main, dark }

extension ParseToString on AvailableTheme {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
