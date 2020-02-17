part of 'dynamic_theme_bloc.dart';

abstract class DynamicThemeState extends Equatable {
  final ThemeData actualTheme;

  DynamicThemeState(this.actualTheme);
}

class LightThemeState extends DynamicThemeState {

  LightThemeState() : super(
    ThemeData(
      primaryColor: LightThemeMaterialColors().harlequinGreen,
      accentColor: LightThemeMaterialColors().harlequinGreen,
      backgroundColor: LightThemeMaterialColors().oxfordBlue,
      cursorColor: Colors.cyan,
      scaffoldBackgroundColor: Colors.blue,
      /*inputDecorationTheme: InputDecorationTheme(
       
      )*/
    )
  );

  String toString()
  {
    return "light theme";
  }
  @override
  List<Object> get props => [actualTheme];

  }

class DarkThemeState extends DynamicThemeState {
  DarkThemeState() : super(
    ThemeData(
      //brightness: Brightness.light,
      primarySwatch: DarkThemeMaterialColors().maastrichtBlue,
      //primaryColor: oxfordBlue,
      //primaryColorBrightness: Brightness.dark,    
      accentColor: DarkThemeMaterialColors().harlequinGreen,
      //scaffoldBackgroundColor: registrationBlack,
      //inputDecorationTheme: customInputDecoration,
  ));
  
    String toString()
  {
    return "dark theme";
  }
  
  @override
  List<Object> get props => [actualTheme];

  }