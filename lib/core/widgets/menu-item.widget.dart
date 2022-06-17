import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/expanded-row.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MenuItemData {
  final String text;
  final String? value;
  final Widget? icon;
  final bool hasChildren;
  final Color? textColor;
  final Color? hoverColor;
  final Color? splashColor;
  final void Function() onTap;
  final void Function(TapDownDetails)? onTapDown;

  MenuItemData(
    this.text, {
    this.value,
    this.icon,
    this.hasChildren = false,
    this.textColor,
    this.hoverColor,
    this.splashColor,
    this.onTapDown,
    required this.onTap,
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
  @override
  final Color? hoverColor;
  @override
  final Color? splashColor;
  @override
  final void Function() onTap;
  @override
  final void Function(TapDownDetails details)? onTapDown;

  final bool needSeparator;

  const ThemedMenuItem(
    this.text, {
    Key? key,
    this.value,
    this.icon,
    this.hasChildren = false,
    this.needSeparator = true,
    this.textColor,
    this.hoverColor,
    this.splashColor,
    required this.onTap,
    this.onTapDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Column(
      children: [
        ExpandedRow(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: AppMetrics.defaultMargin - AppMetrics.littleMargin,
                bottom: AppMetrics.defaultMargin - AppMetrics.littleMargin,
                right: AppMetrics.defaultMargin - AppMetrics.littleMargin,
                left: AppMetrics.defaultMargin - AppMetrics.littleMargin,
              ),
              child: Tapable(
                properties: TapableProps(
                  enableTapAnimation: false,
                  padding: const EdgeInsets.only(
                    top: AppMetrics.littleMargin,
                    bottom: AppMetrics.littleMargin,
                    right: AppMetrics.littleMargin,
                  ),
                  onTap: this.onTap,
                  onTapDown: this.onTapDown,
                  splashColor: this.splashColor,
                  hoverColor:
                      this.hoverColor ?? theme.secondaryColor.withOpacity(0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppMetrics.borderRadius,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppMetrics.defaultMargin -
                                  AppMetrics.littleMargin,
                              right: AppMetrics.defaultMargin,
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
                      Row(
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
                          this.hasChildren
                              ? Icon(
                                  Icons.arrow_forward_ios,
                                  color: theme.textPaleColor,
                                  size: AppMetrics.defaultMargin,
                                )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        this.needSeparator
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppMetrics.defaultMargin * 2 +
                            AppMetrics.littleMargin * 2 -
                            (AppMetrics.defaultMargin -
                                AppMetrics.littleMargin),
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
    );
  }
}
