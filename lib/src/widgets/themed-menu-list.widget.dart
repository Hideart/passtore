import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class MenuItemsList extends StatelessWidget {
  final List<MenuItemData> items;

  const MenuItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeChangable(
      builder: (context, theme) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(AppMetrics.borderRadius),
                // border: Border.all(color: theme.secondaryColor),
              ),
              child: Column(
                children: this
                    .items
                    .map(
                      (item) => MenuItem(
                        item.text,
                        icon: item.icon,
                        value: item.value,
                        hasChildren: item.hasChildren,
                        needSeparator: item != this.items.last,
                        backgroundColor: theme.primaryColor,
                        borderColor: theme.secondaryColor,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
