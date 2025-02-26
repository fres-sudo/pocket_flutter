import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) => ThemeMode.values.byName(json["mode"] as String);

  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {
        "mode": state.name,
      };

  void changeMode(ThemeMode? mode) => emit(mode ?? ThemeMode.system);
}
