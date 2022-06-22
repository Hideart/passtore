import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
import 'package:passtore/core/widgets/squircled-container.widget.dart';
import 'package:passtore/core/widgets/tapable.widget.dart';
import 'package:passtore/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;

    return ThemedScreenWrapper(
      header: ThemedHeaderData(
        title: 'HOME.TITLE'.tr(),
        rightContent: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SquircledContainer(
              border: BorderSide(width: 1, color: theme.textPaleColor),
              child: Tapable(
                properties: TapableProps(
                  enableTapAnimation: false,
                  onTap: () => print('Squircle'),
                  padding: const EdgeInsets.all(AppMetrics.littleMargin / 2),
                  // decoration: BoxDecoration(color: theme.primaryColor),
                  child: const Icon(
                    Icons.add,
                    size: AppMetrics.headerSize,
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
