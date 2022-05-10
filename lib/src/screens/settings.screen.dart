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
        margins: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ThemedHeader(
                  title: 'SETTINGS.TITLE'.tr(),
                ),
              ],
            ),
            MenuItemsList(
              items: [
                MenuItemData(
                  'Language',
                  hasChildren: true,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  value: 'English',
                ),
                MenuItemData('Theme'),
                MenuItemData('Support & Donate', hasChildren: true),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppMetrics.defaultMargin,
              ),
              child: MenuItemsList(
                items: [
                  MenuItemData(
                    'Wipe data',
                    hasChildren: true,
                    icon:
                        const Icon(Icons.arrow_forward_ios, color: Colors.red),
                    value: 'English',
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
