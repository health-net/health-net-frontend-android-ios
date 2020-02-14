import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/presentation/themes/assets/customMaterialColors.dart';

class DarkThemeMaterialColors extends CustomMaterialColors{
  final MaterialColor maastrichtBlue = new MaterialColor(0xFF010038, _maastrichtBlueMap);
  final MaterialColor platinum = new MaterialColor(0xFFD5E2E2, _platinumMap);

  static final Map<int, Color> _maastrichtBlueMap ={
     50:Color.fromRGBO(1, 0, 56, .1),
    100:Color.fromRGBO(1, 0, 56, .2),
    200:Color.fromRGBO(1, 0, 56, .3),
    300:Color.fromRGBO(1, 0, 56, .4),
    400:Color.fromRGBO(1, 0, 56, .5),
    500:Color.fromRGBO(1, 0, 56, .6),
    600:Color.fromRGBO(1, 0, 56, .7),
    700:Color.fromRGBO(1, 0, 56, .8),
    800:Color.fromRGBO(1, 0, 56, .9),
    900:Color.fromRGBO(1, 0, 56, .1),
  };

  static final Map<int, Color> _platinumMap ={
     50:Color.fromRGBO(213, 226, 226, .1),
    100:Color.fromRGBO(213, 226, 226, .2),
    200:Color.fromRGBO(213, 226, 226, .3),
    300:Color.fromRGBO(213, 226, 226, .4),
    400:Color.fromRGBO(213, 226, 226, .5),
    500:Color.fromRGBO(213, 226, 226, .6),
    600:Color.fromRGBO(213, 226, 226, .7),
    700:Color.fromRGBO(213, 226, 226, .8),
    800:Color.fromRGBO(213, 226, 226, .9),
    900:Color.fromRGBO(213, 226, 226, .1),
  };
}