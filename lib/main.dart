import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/assets/metrics.dart';
import 'package:passtore/assets/themes/themes.dart';
import 'package:passtore/core/models/models.dart';
import 'package:passtore/core/widgets/theme-transition.widget.dart';
import 'package:passtore/src/screens/home.screen.dart';
import 'package:passtore/src/widgets/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:passtore/src/services/services.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Change app orientation to the portrait mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // Set translucent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  await EasyLocalization.ensureInitialized();
}

void main() async {
  await initApp();

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () {
      DI.init();
      return runApp(
        EasyLocalization(
          startLocale: new Locale(Platform.localeName.split('_')[0], ''),
          supportedLocales: const [Locale('en', ''), Locale('ru', '')],
          path: 'lib/assets/translations',
          fallbackLocale: const Locale('en', ''),
          child: const PasstoreApp(),
        ),
      );
    },
    storage: storage,
  );
}

class PasstoreApp extends StatelessWidget {
  const PasstoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => DI.get<ThemeCubit>(instanceName: 'theme'),
        ),
        BlocProvider<StorageCubit>(
          create: (_) => DI.get<StorageCubit>(instanceName: 'safeStorage'),
        ),
        BlocProvider<OverlayCubit>(
          create: (_) => DI.get<OverlayCubit>(instanceName: 'overlays'),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, theme) {
          late final ThemeData themeData;
          switch (theme.name) {
            case AvailableTheme.LIGHT:
              themeData = lightThemeData;
              break;
            default:
              themeData = darkThemeData;
              break;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: ThemeTransition(
              theme: themeData,
              offset: themeSwitcherTapPosition,
              duration: AppMetrics.switchThemeDuration,
              child: Stack(
                key: const PageStorageKey('__THEME_TRANSITION_BASE__'),
                children: [
                  Scaffold(
                    body: HomeScreen(),
                    floatingActionButton: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 80,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            heroTag: 'modals',
                            child: const Icon(Icons.window),
                            onPressed: () {
                              context.read<OverlayCubit>().addOverlay(
                                    CustomModal(
                                      id: 'testModal',
                                      child: const Text('modal testing'),
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                            heroTag: 'modals1',
                            child: const Icon(Icons.window),
                            onPressed: () {
                              context.read<OverlayCubit>().addOverlay(
                                    CustomModal(
                                      id: 'testModal1',
                                      title: 'Test modal 1',
                                      message: 'modal testing 123',
                                      buttons: [
                                        ThemedButton(
                                          text: 'Confirm',
                                          enableStartAnimation: true,
                                          onTap: () =>
                                              print('Custom modal button'),
                                        ),
                                      ],
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                            heroTag: 'modals123',
                            child: const Icon(Icons.window),
                            onPressed: () {
                              context.read<OverlayCubit>().addOverlay(
                                    CustomModal(
                                      id: 'MultipleButtons',
                                      title: 'Multiple buttons',
                                      message:
                                          'Multiple buttons\nTesting\nkjk\nTesting kjk\nTesting kjk\nTesting kjk\nTesting kjk\nTesting kjk',
                                      buttons: [
                                        ThemedButton(
                                          text: 'Confirm',
                                          enableStartAnimation: true,
                                          onTap: () =>
                                              print('Custom modal button'),
                                        ),
                                        ThemedButton(
                                          text: 'Reject',
                                          enableStartAnimation: true,
                                          onTap: () =>
                                              print('Custom modal button'),
                                        ),
                                      ],
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                            heroTag: 'modals',
                            child: const Icon(Icons.telegram),
                            onPressed: () => DI
                                .get<ThemeCubit>(
                                  instanceName: 'theme',
                                )
                                .changeTheme(
                                  AvailableTheme.LIGHT,
                                ),
                          ),
                          const SizedBox(height: 10),
                          FloatingActionButton(
                            heroTag: 'themes',
                            child: const Icon(Icons.abc_rounded),
                            onPressed: () => DI
                                .get<ThemeCubit>(
                                  instanceName: 'theme',
                                )
                                .changeTheme(
                                  AvailableTheme.DARK,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Material(
                    type: MaterialType.transparency,
                    child: ModalsContainer(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
