import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/assets/shapes/squircle.shape.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/core/widgets/shaped-container.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/services/locator.service.dart';
import 'package:passtore/src/services/theme.service.dart';
import 'package:passtore/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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
      header: ThemedHeaderData(
        title: 'HOME.TITLE'.tr(),
        applyBottomBorder: true,
        pinned: true,
        rightContent: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShapedContainer(
              border: BorderSide(width: 1, color: theme.secondaryColor),
              shapePath: squircleShape,
              child: Tapable(
                properties: TapableProps(
                  enableTapAnimation: false,
                  onTap: this.handleSwitchTheme(theme),
                  onTapDown: ThemeSwitcher.handleTapDown,
                  padding: const EdgeInsets.all(AppMetrics.littleMargin),
                  decoration: BoxDecoration(color: theme.primaryColor),
                  child: Icon(
                    theme.brightness == Brightness.light
                        ? Icons.wb_sunny_outlined
                        : Icons.mode_night_outlined,
                    size: AppMetrics.headerSize - AppMetrics.littleMargin / 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
              MenuItemsList(
                title: 'SETTINGS.TITLE'.tr(),
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
                    onTap: () => print('test'),
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
                    onTap: () => print('test1'),
                  ),
                ],
              ),
              const SizedBox(height: AppMetrics.defaultMargin),
            ],
          ),
        ),
      ],
    );
  }
}
