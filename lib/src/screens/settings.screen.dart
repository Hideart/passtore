import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/theme.service.dart';
import 'package:passtore/src/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;

    return ThemedScreenWrapper(
      contentKey: const PageStorageKey('__SETTINGS_SCREEN_WRAPPER__'),
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
                    icon: Icon(
                      Icons.language,
                      color: theme.textPrimaryColor,
                    ),
                    value: 'English',
                    onTap: () => DI
                        .get<ThemeCubit>(
                          instanceName: 'theme',
                        )
                        .changeTheme(
                          AvailableTheme.LIGHT,
                        ),
                  ),
                  MenuItemData(
                    'Theme',
                    hasChildren: true,
                    value: theme.name.toString(),
                    icon: Icon(
                      Icons.color_lens_outlined,
                      color: theme.textPrimaryColor,
                    ),
                    onTap: () {
                      switch (theme.name) {
                        case AvailableTheme.LIGHT:
                          DI
                              .get<ThemeCubit>(
                                instanceName: 'theme',
                              )
                              .changeTheme(
                                AvailableTheme.DARK,
                              );
                          break;
                        default:
                          DI
                              .get<ThemeCubit>(
                                instanceName: 'theme',
                              )
                              .changeTheme(
                                AvailableTheme.LIGHT,
                              );
                      }
                    },
                  ),
                  MenuItemData(
                    'Support & Donate',
                    icon: Icon(
                      Icons.support_agent,
                      color: theme.textPrimaryColor,
                    ),
                    onTap: () {},
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
                      hoverColor: Colors.red.withOpacity(0.2),
                      splashColor: Colors.red.withOpacity(0.2),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onTap: () {},
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
                      onTap: () {},
                    ),
                    MenuItemData(
                      'Wipe all data',
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.textPrimaryColor,
                      ),
                      onTap: () {},
                    ),
                    MenuItemData(
                      'Wipe all data',
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.textPrimaryColor,
                      ),
                      onTap: () {},
                    ),
                    MenuItemData(
                      'Wipe all data',
                      icon: Icon(
                        Icons.delete_outline,
                        color: theme.textPrimaryColor,
                      ),
                      onTap: () {},
                    ),
                    MenuItemData(
                      'Wipe all data',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
