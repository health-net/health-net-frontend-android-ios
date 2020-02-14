part of 'dynamic_theme_bloc.dart';


abstract class DynamicThemeEvent extends Equatable {
  final int themeCode;
  const DynamicThemeEvent(this.themeCode);
}

class LightThemeSelected extends DynamicThemeEvent {
  LightThemeSelected() : super(1);

  @override
  String toString() => 'LightTheme';

  @override
  List<Object> get props => [];
}

class DarkThemeSelected extends DynamicThemeEvent {
  DarkThemeSelected() : super(2);

  @override
  String toString() => 'Dark Theme';

  @override
  List<Object> get props => [];
}