import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/core/theme/app_theme.dart';
import 'package:flutter_login/core/theme/bloc/theme_event.dart';

import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.themeData.brightness == Brightness.light) {
        emit(ThemeState(themeData: AppTheme.darkTheme));
      } else {
        emit(ThemeState(themeData: AppTheme.lightTheme));
      }
    });
  }
}
