import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/core/utils/password-generator.util.dart';
import 'package:passtore/core/utils/safe-storage.util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:passtore/src/screens/main.screen.dart';
import 'package:passtore/src/services/services.dart';

Future initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Change app orientation to the portrait mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
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
        child: PasstoreApp(),
      ),
    ),
    storage: storage,
  );
}

class PasstoreApp extends StatelessWidget {
  final SafeStorage _safeStorage = SafeStorage(passphrase: Password.generate());
  String encData = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration.zero, DI.init),
      builder: (context, snapshot) => MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => DI.get<ThemeCubit>(),
          )
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Scaffold(
            body: MainScreen(),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  key: const ValueKey('encrypt'),
                  child: const Icon(Icons.storage),
                  onPressed: () {
                    this.encData = this._safeStorage.encrypt('123', 'qwerty');
                    print('enc: $encData');
                  },
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  key: const ValueKey('decrypt'),
                  child: const Icon(Icons.text_decrease),
                  onPressed: () => print(
                    'dec: ${this._safeStorage.decrypt(this.encData, '123')}',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
