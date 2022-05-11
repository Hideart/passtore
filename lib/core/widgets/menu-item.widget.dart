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

class ThemedMenuItem extends StatefulWidget implements MenuItemData {
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
  State<ThemedMenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<ThemedMenuItem> {
  double _backgroundOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => Column(
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
                  enableTapAnimation: false,
                  padding: const EdgeInsets.only(
                    top: AppMetrics.littleMargin,
                    bottom: AppMetrics.littleMargin,
                    right: AppMetrics.littleMargin,
                  ),
                  onHover: (hovered) {
                    if (hovered) {
                      this.setState(() {
                        this._backgroundOpacity = 0.6;
                      });
                    } else {
                      this.setState(() {
                        this._backgroundOpacity = 0.0;
                      });
                    }
                  },
                  onTap: () => print('Menu item tap'),
                  splashColor: theme.secondaryColor.withOpacity(0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppMetrics.borderRadius,
                    ),
                    color: theme.secondaryColor
                        .withOpacity(this._backgroundOpacity),
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
                              child: this.widget.icon ?? const SizedBox(),
                            ),
                          ),
                          ThemedText(
                            this.widget.text,
                            type: ThemedTextType.primary,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: this.widget.textColor ??
                                  theme.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      this.widget.hasChildren
                          ? Row(
                              children: [
                                this.widget.value != null &&
                                        this.widget.value!.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppMetrics.littleMargin / 2,
                                        ),
                                        child: ThemedText(
                                          this.widget.value!,
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
              ),
            ],
          ),
          this.widget.needSeparator
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
      ),
    );
  }
}
