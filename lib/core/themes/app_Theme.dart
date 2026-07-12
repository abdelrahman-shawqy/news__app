import 'package:flutter/material.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.primaryColorDark,
      secondary: AppColors.grey,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      displayMedium: AppTextStyles.b700,
      displaySmall: AppTextStyles.m500,
      displayLarge: AppTextStyles.mBar,
      bodyLarge: AppTextStyles.b700Drawer
    ),
    appBarTheme: AppBarTheme(centerTitle: true,)
  );
  static ThemeData DarkTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryColorDark,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.grey,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: TextTheme(
          displayMedium: AppTextStyles.b700,
          displaySmall: AppTextStyles.m500Dark,
          displayLarge: AppTextStyles.mBarDark,
          bodyLarge: AppTextStyles.b700Drawer
      ),
      appBarTheme: AppBarTheme(centerTitle: true,)
  );
}
