import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:passtore/src/screens/main.screen.dart';
import 'package:passtore/src/store/theme.store.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Change app orientation to the landscape mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );

  // Set translucent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

void main() async {
  await initApp();

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        startLocale: new Locale(Platform.localeName.split('_')[0], ''),
        supportedLocales: const [Locale('en', ''), Locale('ru', '')],
        path: 'lib/assets/translations',
        fallbackLocale: const Locale('en', ''),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (BuildContext context) => ThemeCubit(),
            ),
          ],
          child: PasstoreApp(),
        ),
      ),
    ),
    storage: storage,
  );
}

class PasstoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Scaffold(body: MainScreen()),
    );
  }
}
