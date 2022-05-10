import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MenuItemsList extends StatelessWidget {
  final List<MenuItemData> items;
  final String? title;

  const MenuItemsList({Key? key, this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.title != null && this.title!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppMetrics.defaultMargin,
                  ),
                  child: ThemedText(
                    this.title!,
                    type: ThemedTextType.primary,
                    style: const TextStyle(
                      fontSize: AppMetrics.textSize,
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
                    borderRadius:
                        BorderRadius.circular(AppMetrics.borderRadius),
                    // border: Border.all(color: theme.secondaryColor),
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
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
