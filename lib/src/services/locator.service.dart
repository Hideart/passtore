import 'package:get_it/get_it.dart';
import 'package:passtore/src/services/theme.service.dart';

class DI {
  static final GetIt _locator = GetIt.instance;

  static void init() {
    DI._locator.registerSingleton<ThemeCubit>(ThemeCubit());
  }

  static T get<T extends Object>() {
    return DI._locator<T>();
  }
}
