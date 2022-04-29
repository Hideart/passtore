import 'package:flutter/material.dart';
import 'package:passtore/src/widgets/theme-changable.widget.dart';

enum ThemedTextType { primary, secondary }

class ThemedText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final ThemedTextType type;

  const ThemedText(
    this.data, {
    this.type = ThemedTextType.secondary,
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (themeContext, theme) {
        Color textColor = type == ThemedTextType.primary
            ? theme.textPrimaryColor
            : theme.textSecondaryColor;
        final TextStyle themedStyle = TextStyle(
          color: textColor,
          fontSize: this.style?.fontSize ?? 24.0,
          fontWeight: this.style?.fontWeight ?? FontWeight.normal,
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
