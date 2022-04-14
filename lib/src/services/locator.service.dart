import 'package:get_it/get_it.dart';
import 'package:passtore/src/services/services.dart';

class DI {
  static final GetIt _locator = GetIt.instance;

  static void init() {
    DI._locator.registerSingleton<ThemeCubit>(
      ThemeCubit(),
      instanceName: 'theme',
    );
    DI._locator.registerSingleton<StorageCubit>(
      StorageCubit(),
      instanceName: 'safeStorage',
    );
    // DI._locator.registerSingleton<ModalsCubit>(
    //   ModalsCubit(),
    //   instanceName: 'modals',
    // );
  }

  static T get<T extends Object>({String? instanceName}) {
    return DI._locator<T>(instanceName: instanceName);
  }
}
