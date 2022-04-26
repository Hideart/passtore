import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/core/models/models.dart';
import 'package:passtore/src/services/services.dart';

class ThemeChangable extends StatelessWidget {
  final Widget Function(BuildContext, AppTheme) builder;

  const ThemeChangable({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppTheme>(
      builder: (context, theme) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Container(
          key: ValueKey(theme.name),
          child: this.builder(context, theme),
        ),
      ),
    );
  }
}
