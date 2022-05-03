import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class ThemedModalContent extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? message;

  const ThemedModalContent({this.child, this.title, this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => ExpandedRow(
        child: Container(
          padding: const EdgeInsets.all(AppMetrics.defaultMargin),
          constraints: const BoxConstraints(minHeight: 150),
          decoration: BoxDecoration(
            color: theme.darkBackgroundColor,
            borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
            border: Border.all(color: theme.secondaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title
              this.title != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppMetrics.defaultMargin,
                          ),
                          child: ThemedText(
                            this.title!,
                            type: ThemedTextType.secondary,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              // Content
              this.child == null && this.message != null
                  ? ThemedText(
                      this.message!,
                      type: ThemedTextType.primary,
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
              this.child != null ? this.child! : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
