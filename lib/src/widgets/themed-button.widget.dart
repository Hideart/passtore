import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedButton extends StatelessWidget {
  final TimelineSyncFunction onTap;
  final String? text;

  const ThemedButton({required this.onTap, this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => ExpandedRow(
        child: Tapable(
          onTap: this.onTap,
          child: Container(
            padding: const EdgeInsets.all(AppMetrics.defaultMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
              color: theme.accentColor,
            ),
            child: const ThemedText(
              'test button',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              type: ThemedTextType.primary,
            ),
          ),
        ),
      ),
    );
  }
}
