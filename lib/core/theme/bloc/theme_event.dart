import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ToggleThemeEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}
