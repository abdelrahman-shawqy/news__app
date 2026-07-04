
import 'package:flutter/material.dart';

class AppTheme{
static ThemeData LightTheme = ThemeData(
textTheme: TextTheme(),
  colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface)

);
static ThemeData DarkTheme = ThemeData(
  textTheme: TextTheme(),
);
}