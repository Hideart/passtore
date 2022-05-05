import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/src/widgets/themed-text.widget.dart';

class ThemedHeader extends StatelessWidget {
  final String title;

  const ThemedHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppMetrics.defaultMargin * 3,
            left: AppMetrics.defaultMargin,
            right: AppMetrics.defaultMargin,
          ),
          child: ThemedText(
            this.title,
            textAlign: TextAlign.right,
            type: ThemedTextType.primary,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppMetrics.headerSize,
            ),
          ),
        )
      ],
    );
  }
}
