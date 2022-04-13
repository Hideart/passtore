import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class StorageCubit extends HydratedCubit<Map<String, String>> {
  StorageCubit([Map<String, String>? initialState]) : super(initialState ?? {});

  final Map<String, String> storage = {};

  void save({required String key, required String value}) {
    this.storage.addAll({key: value});
    return emit(this.storage);
  }

  String? read(String key) {
    return this.storage[key];
  }

  Map<String, String> _decodeJson(String jsonString) {
    final Map<String, dynamic> dynamicMap =
        json.decode(jsonString) as Map<String, dynamic>;
    return dynamicMap.map(
      (String key, dynamic value) => MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  @override
  Map<String, String>? fromJson(Map<String, dynamic> json) {
    String? loaded = json['safeStorage'] as String?;
    if (loaded != null) {
      return this._decodeJson(loaded);
    }
    return null;
  }

  @override
  Map<String, String> toJson(Map<String, String> state) {
    return {'safeStorage': json.encode(state)};
  }
}
