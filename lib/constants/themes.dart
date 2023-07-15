import 'package:flutter/material.dart';
import './colors.dart';

class ThemeClass {
  static ThemeData light_theme = ThemeData(
    scaffoldBackgroundColor: CustomColors.primary_light,
    brightness: Brightness.light,
    fontFamily: 'Exo 2',
    primaryColor: CustomColors.primary_light,
    secondaryHeaderColor: CustomColors.secondary_light,
  );

  static ThemeData dark_theme = ThemeData(
    scaffoldBackgroundColor: CustomColors.primary_dark,
    brightness: Brightness.dark,
    fontFamily: 'Exo 2',
    primaryColor: CustomColors.primary_dark,
    secondaryHeaderColor: CustomColors.secondary_dark,
  );
}
