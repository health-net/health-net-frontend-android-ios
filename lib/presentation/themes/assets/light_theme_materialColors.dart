//Light theme colors
import 'package:flutter/material.dart';
import 'customMaterialColors.dart';

class LightThemeMaterialColors extends CustomMaterialColors{
  final MaterialColor oxfordBlue = new MaterialColor(0XFF0A0D54, _oxfordBlueMap);
  final MaterialColor ghostWhite = new MaterialColor(0XFFF7F7FF, _ghostWhiteMap);
  final MaterialColor lightGrey = new MaterialColor(0xFFCFD2CD, _lightGreyMap);

  static final Map<int, Color> _oxfordBlueMap ={
    50:Color.fromRGBO(10, 13, 84, .1),
    100:Color.fromRGBO(10, 13, 84, .2),
    200:Color.fromRGBO(10, 13, 84, .3),
    300:Color.fromRGBO(10, 13, 84, .4),
    400:Color.fromRGBO(10, 13, 84, .5),
    500:Color.fromRGBO(10, 13, 84, .6),
    600:Color.fromRGBO(10, 13, 84, .7),
    700:Color.fromRGBO(10, 13, 84, .8),
    800:Color.fromRGBO(10, 13, 84, .9),
    900:Color.fromRGBO(10, 13, 84, .1),
  };

  static final Map<int, Color> _ghostWhiteMap ={
    50:Color.fromRGBO(247, 247, 255, .1),
    100:Color.fromRGBO(247, 247, 255, .2),
    200:Color.fromRGBO(247, 247, 255, .3),
    300:Color.fromRGBO(247, 247, 255, .4),
    400:Color.fromRGBO(247, 247, 255, .5),
    500:Color.fromRGBO(247, 247, 255, .6),
    600:Color.fromRGBO(247, 247, 255, .7),
    700:Color.fromRGBO(247, 247, 255, .8),
    800:Color.fromRGBO(247, 247, 255, .9),
    900:Color.fromRGBO(247, 247, 255, .1),
  };

  static final Map<int, Color> _lightGreyMap ={
    50:Color.fromRGBO(207, 210, 205, .1),
    100:Color.fromRGBO(207, 210, 205, .2),
    200:Color.fromRGBO(207, 210, 205, .3),
    300:Color.fromRGBO(207, 210, 205, .4),
    400:Color.fromRGBO(207, 210, 205, .5),
    500:Color.fromRGBO(207, 210, 205, .6),
    600:Color.fromRGBO(207, 210, 205, .7),
    700:Color.fromRGBO(207, 210, 205, .8),
    800:Color.fromRGBO(207, 210, 205, .9),
    900:Color.fromRGBO(207, 210, 205, .1),
  }; 
}






	