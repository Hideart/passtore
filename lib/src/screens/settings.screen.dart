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
            child: ThemeChangable(
              builder: (context, theme) {
                return Column(
                  children: [
                    MenuItemsList(
                      items: [
                        MenuItemData(
                          'Language',
                          hasChildren: true,
                          icon: Icon(
                            Icons.language,
                            color: theme.textPrimaryColor,
                          ),
                          value: 'English',
                        ),
                        MenuItemData(
                          'Theme',
                          hasChildren: true,
                          value: 'Dark',
                          icon: Icon(
                            Icons.color_lens_outlined,
                            color: theme.textPrimaryColor,
                          ),
                        ),
                        MenuItemData(
                          'Support & Donate',
                          icon: Icon(
                            Icons.support_agent,
                            color: theme.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppMetrics.defaultMargin,
                      ),
                      child: MenuItemsList(
                        title: 'Another',
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppMetrics.defaultMargin,
                      ),
                      child: MenuItemsList(
                        title: 'Main params',
                        items: [
                          MenuItemData(
                            'Wipe all data',
                            icon: Icon(
                              Icons.delete_outline,
                              color: theme.textPrimaryColor,
                            ),
                          ),
                          MenuItemData(
                            'Wipe all data',
                            icon: Icon(
                              Icons.delete_outline,
                              color: theme.textPrimaryColor,
                            ),
                          ),
                          MenuItemData(
                            'Wipe all data',
                            icon: Icon(
                              Icons.delete_outline,
                              color: theme.textPrimaryColor,
                            ),
                          ),
                          MenuItemData(
                            'Wipe all data',
                            icon: Icon(
                              Icons.delete_outline,
                              color: theme.textPrimaryColor,
                            ),
                          ),
                          MenuItemData(
                            'Wipe all data',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
