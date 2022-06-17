import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/theme.service.dart';
import 'package:passtore/src/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  Function() handleSwitchLanguage(BuildContext context) {
    return () {
      Locale nextLocale = context.locale.languageCode == 'ru'
          ? const Locale('en')
          : const Locale('ru');
      context.setLocale(nextLocale);
    };
  }

  Function() handleSwitchTheme(AppTheme theme) {
    return () {
      AvailableTheme nexTheme = theme.name == AvailableTheme.LIGHT
          ? AvailableTheme.DARK
          : AvailableTheme.LIGHT;
      DI
          .get<ThemeCubit>(
            instanceName: 'theme',
          )
          .changeTheme(nexTheme);
    };
  }

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
                    'SETTINGS.LANGUAGE.TITLE'.tr(),
                    icon: Icon(
                      Icons.language,
                      color: theme.textPrimaryColor,
                    ),
                    value: context.locale.languageCode == 'ru'
                        ? 'SETTINGS.LANGUAGE.RU'.tr()
                        : 'SETTINGS.LANGUAGE.EN'.tr(),
                    onTap: this.handleSwitchLanguage(context),
                  ),
                  MenuItemData(
                    'SETTINGS.THEME.TITLE'.tr(),
                    value: theme.name.toString() == 'Light'
                        ? 'SETTINGS.THEME.LIGHT'.tr()
                        : 'SETTINGS.THEME.DARK'.tr(),
                    icon: Icon(
                      Icons.color_lens_outlined,
                      color: theme.textPrimaryColor,
                    ),
                    onTap: this.handleSwitchTheme(theme),
                    onTapDown: ThemeSwitcher.handleTapDown,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
