import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

enum ButtonType { primary, secondary, disabled }

class ThemedButton extends StatelessWidget {
  final String? text;
  final TimelineSyncFunction onTap;
  final ButtonType type;

  const ThemedButton({
    required this.onTap,
    this.text,
    this.type = ButtonType.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) {
        List<Color> _buttonBackground;
        switch (this.type) {
          case ButtonType.secondary:
            _buttonBackground = [theme.primaryColor, theme.primaryColor];
            break;
          default:
            _buttonBackground = [theme.accentColor, theme.accentSecondaryColor];
            break;
        }
        return ExpandedRow(
          children: [
            Tapable(
              onTap: this.onTap,
              child: Container(
                padding: const EdgeInsets.all(AppMetrics.littleMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: _buttonBackground,
                  ),
                ),
                child: this.text != null
                    ? ThemedText(
                        this.text!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        type: ThemedTextType.primary,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        );
      },
    );
  }
}
