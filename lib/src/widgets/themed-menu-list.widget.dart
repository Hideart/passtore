import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MenuItemsList extends StatelessWidget {
  final List<MenuItemData> items;
  final String? title;

  const MenuItemsList({Key? key, this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.title != null && this.title!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  left: AppMetrics.defaultMargin,
                  bottom: AppMetrics.defaultMargin,
                ),
                child: ThemedText(
                  this.title!.toUpperCase(),
                  type: ThemedTextType.secondary,
                  style: const TextStyle(
                    fontSize: AppMetrics.littleTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
                  border: Border.all(color: theme.secondaryColor),
                ),
                child: Column(
                  children: this
                      .items
                      .map(
                        (item) => ThemedMenuItem(
                          item.text,
                          icon: item.icon,
                          value: item.value,
                          hasChildren: item.hasChildren,
                          needSeparator: item != this.items.last,
                          textColor: item.textColor ?? theme.textPrimaryColor,
                          hoverColor: item.hoverColor,
                          splashColor: item.splashColor,
                          onTap: item.onTap,
                          onTapDown: item.onTapDown,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
