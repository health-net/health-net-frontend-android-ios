import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/presentation/themes/assets/dark_theme_materialColors.dart';
import 'package:health_net_frontend_android_ios/presentation/themes/assets/light_theme_materialColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dynamic_theme_event.dart';
part 'dynamic_theme_state.dart';


class DynamicThemeBloc extends Bloc<DynamicThemeEvent, DynamicThemeState> {
  //Interfaces to obtain a state change
  void switchToLightTheme()=>add(LightThemeSelected());
  void switchToDarkTheme()=>add(DarkThemeSelected());

  //setting LightTheme if no event occurs.
  @override
  DynamicThemeState get initialState => (DarkThemeState());

  @override
  Stream<DynamicThemeState> mapEventToState(DynamicThemeEvent event,) async*{
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    if(event is LightThemeSelected)
      {
        themePrefs.setInt('theme_option', event.themeCode);
        yield LightThemeState();
      }
    if(event is DarkThemeSelected)
      {
        themePrefs.setInt('theme_option', event.themeCode);
        yield DarkThemeState();
      }

  }
}
