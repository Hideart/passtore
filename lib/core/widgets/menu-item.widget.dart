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

  MenuItemData(
    this.text, {
    this.value,
    this.icon,
    this.hasChildren = false,
  });
}

class MenuItem extends StatelessWidget implements MenuItemData {
  @override
  final String text;
  @override
  final String? value;
  @override
  final Widget? icon;
  @override
  final bool hasChildren;
  final bool needSeparator;
  final Color backgroundColor;
  final Color borderColor;

  const MenuItem(
    this.text, {
    Key? key,
    this.value,
    this.icon,
    this.hasChildren = false,
    this.needSeparator = true,
    this.backgroundColor = Colors.red,
    this.borderColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tapable(
          child: ExpandedRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  top: AppMetrics.defaultMargin,
                  bottom: AppMetrics.defaultMargin,
                  left: AppMetrics.defaultMargin * 2,
                ),
                decoration: BoxDecoration(
                  color: this.backgroundColor,
                  borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
                ),
                child: ThemedText(
                  this.text,
                  type: ThemedTextType.primary,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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
                        left: AppMetrics.defaultMargin * 2,
                      ),
                      child: Container(
                        height: 1,
                        color: this.borderColor,
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
