import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/theme-changable.widget.dart';

class ThemedScreenWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margins;

  const ThemedScreenWrapper({Key? key, this.margins, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ThemeChangable(
          builder: (themeContext, theme) => Container(
            // key: ValueKey(theme.name),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.darkBackgroundColor, theme.darkBackgroundColor],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            padding: this.margins ?? const EdgeInsets.all(0),
            child: this.child,
          ),
        ),
      ],
    );
  }
}
