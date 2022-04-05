import 'package:get_it/get_it.dart';
import 'package:passtore/src/services/theme.service.dart';

class DI {
  final GetIt _locator = GetIt.instance;

  DI.init() {
    this._locator.registerSingleton<ThemeCubit>(ThemeCubit());
  }

  T get<T extends Object>(dynamic param1, dynamic param2) {
    return this._locator<T>();
  }
}
