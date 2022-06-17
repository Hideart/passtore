import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/core/models/theme.model.dart';
import 'package:passtore/core/widgets/icon-button.widget.dart';
import 'package:passtore/core/widgets/menu-item.widget.dart';
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
            SquaredIconButton(
              borderColor: theme.secondaryColor,
              properties: TapableProps(
                onTap: () => print('test'),
                enableTapAnimation: false,
                child: const Icon(
                  Icons.add,
                  size: AppMetrics.headerSize - AppMetrics.littleMargin,
                ),
              ),
            ),
            const SizedBox(width: AppMetrics.littleMargin / 2),
            SquaredIconButton(
              borderColor: theme.secondaryColor,
              properties: TapableProps(
                onTap: () => print('test1'),
                enableTapAnimation: false,
                child: const Icon(
                  Icons.settings_outlined,
                  size: AppMetrics.headerSize - AppMetrics.littleMargin,
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
            ],
          ),
        ),
      ],
    );
  }
}
