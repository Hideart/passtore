import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MenuItemData {
  final String text;
  final String? value;
  final Widget? icon;
  final bool hasChildren;
  final Color? textColor;

  MenuItemData(
    this.text, {
    this.value,
    this.icon,
    this.hasChildren = false,
    this.textColor,
  });
}

class ThemedMenuItem extends StatelessWidget implements MenuItemData {
  @override
  final String text;
  @override
  final String? value;
  @override
  final Widget? icon;
  @override
  final bool hasChildren;
  @override
  final Color? textColor;

  final bool needSeparator;

  const ThemedMenuItem(
    this.text, {
    Key? key,
    this.value,
    this.icon,
    this.hasChildren = false,
    this.needSeparator = true,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => Column(
        children: [
          Tapable(
            child: ExpandedRow(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: AppMetrics.defaultMargin,
                    bottom: AppMetrics.defaultMargin,
                    right: AppMetrics.defaultMargin,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppMetrics.borderRadius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppMetrics.defaultMargin,
                            ),
                            child: Container(
                              width: AppMetrics.littleMargin * 2,
                              constraints: const BoxConstraints(
                                maxWidth: AppMetrics.littleMargin * 2,
                              ),
                              child: this.icon ?? const SizedBox(),
                            ),
                          ),
                          ThemedText(
                            this.text,
                            type: ThemedTextType.primary,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: this.textColor ?? theme.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      this.hasChildren
                          ? Row(
                              children: [
                                this.value != null && this.value!.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppMetrics.littleMargin / 2,
                                        ),
                                        child: ThemedText(
                                          this.value!,
                                          style: TextStyle(
                                            fontSize: AppMetrics.littleTextSize,
                                            color: theme.textPaleColor,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: theme.textPaleColor,
                                  size: AppMetrics.defaultMargin,
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () => print('Menu item tap'),
          ),
          this.needSeparator
              ? Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: AppMetrics.defaultMargin * 2 +
                              AppMetrics.littleMargin * 2,
                        ),
                        child: Container(
                          height: 1,
                          color: theme.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
