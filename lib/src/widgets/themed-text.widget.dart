import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/theme-changable.widget.dart';

class ThemedText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const ThemedText(this.data, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (themeContext, theme) {
        final TextStyle themedStyle = TextStyle(
          color: theme.textPrimaryColor,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          inherit: this.style?.inherit ?? true,
          backgroundColor: this.style?.backgroundColor,
          fontStyle: this.style?.fontStyle,
          letterSpacing: this.style?.letterSpacing,
          wordSpacing: this.style?.wordSpacing,
          textBaseline: this.style?.textBaseline,
          height: this.style?.height,
          leadingDistribution: this.style?.leadingDistribution,
          locale: this.style?.locale,
          foreground: this.style?.foreground,
          background: this.style?.background,
          shadows: this.style?.shadows,
          fontFeatures: this.style?.fontFeatures,
          decoration: this.style?.decoration,
          decorationColor: this.style?.decorationColor,
          decorationStyle: this.style?.decorationStyle,
          decorationThickness: this.style?.decorationThickness,
          debugLabel: this.style?.debugLabel,
          overflow: this.style?.overflow,
        );
        return Text(
          this.data,
          style: themedStyle,
          key: ValueKey(theme.name),
        );
      },
    );
  }
}
