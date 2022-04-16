import 'package:get_it/get_it.dart';
import 'package:passtore/src/services/services.dart';

class DI {
  static final GetIt _locator = GetIt.instance;

  static void init() {
    DI.registerSingleton<ThemeCubit>(
      ThemeCubit(),
      instanceName: 'theme',
    );
    DI.registerSingleton<StorageCubit>(
      StorageCubit(),
      instanceName: 'safeStorage',
    );
  }

  static void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
  }) {
    DI._locator.registerSingleton<T>(
      instance,
      instanceName: instanceName,
    );
  }

  static void registerLazySingleton<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    DI._locator.registerLazySingleton<T>(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  static T get<T extends Object>({String? instanceName}) {
    return DI._locator<T>(instanceName: instanceName);
  }
}
