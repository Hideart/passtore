import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/theme-changable.widget.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';

class ThemedModalContent extends StatelessWidget {
  final Widget child;
  final Widget? title;

  const ThemedModalContent({required this.child, this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => ExpandedRow(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: theme.darkBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.secondaryColor),
          ),
          child: child,
          margin: const EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
