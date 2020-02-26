part of 'dynamic_theme_bloc.dart';

abstract class DynamicThemeState extends Equatable {
  final ThemeData actualTheme;

  DynamicThemeState(this.actualTheme);
}

class LightThemeState extends DynamicThemeState {

  LightThemeState() : super(ThemeData.dark());

  String toString()
  {
    return "light theme";
  }
  @override
  List<Object> get props => [actualTheme];

  }

class DarkThemeState extends DynamicThemeState {
  DarkThemeState() : super(ThemeData.dark());
  
    String toString()
  {
    return "dark theme";
  }
  
  @override
  List<Object> get props => [actualTheme];

  }