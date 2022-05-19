import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:passtore/core/extensions/extensions.dart';
import 'package:passtore/assets/themes/themes.dart';
import 'package:passtore/core/models/theme.model.dart';

class ThemeCubit extends HydratedCubit<AppTheme> {
  ThemeCubit([AppTheme? initialState]) : super(initialState ?? lightTheme);

  final List<AppTheme> _themes = [lightTheme, darkTheme];

  void changeTheme(AvailableTheme themeName) {
    final AppTheme? theme = this._themes.find((th) => th.name == themeName);
    if (theme != null) {
      emit(theme);
      return;
    }
    return emit(state);
  }

  @override
  AppTheme? fromJson(Map<String, dynamic> json) {
    final String? themeName = json['currentTheme'] as String?;
    final currentTheme = this._themes.find((th) {
      var th2 = th;
      return th2.name.toString() == themeName;
    });
    if (currentTheme != null) {
      return currentTheme;
    }
    return null;
  }

  @override
  Map<String, String> toJson(AppTheme state) {
    return {'currentTheme': state.name.toString()};
  }
}
