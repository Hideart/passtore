import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passtore/src/services/services.dart';
import 'package:passtore/src/store/theme.store.dart';

class ThemeChangable extends StatelessWidget {
  final Widget Function(BuildContext, AppTheme) builder;

  const ThemeChangable({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: this.builder,
      ),
    );
  }
}
