import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemedScreenWrapper(
        header: ThemedHeaderData(title: 'SETTINGS.TITLE'.tr(), pinned: true),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppMetrics.defaultMargin,
            ),
            child: Column(
              children: [
                MenuItemsList(
                  items: [
                    MenuItemData(
                      'Language',
                      hasChildren: true,
                      icon: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      value: 'English',
                    ),
                    MenuItemData(
                      'Theme',
                      hasChildren: true,
                      value: 'Dark',
                      icon: const Icon(
                        Icons.color_lens_outlined,
                        color: Colors.white,
                      ),
                    ),
                    MenuItemData(
                      'Support & Donate',
                      icon: const Icon(
                        Icons.support_agent,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppMetrics.defaultMargin,
                  ),
                  child: MenuItemsList(
                    items: [
                      MenuItemData(
                        'Wipe all data',
                        textColor: Colors.red,
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
