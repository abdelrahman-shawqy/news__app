import 'package:bloc/bloc.dart';
import 'package:news_appp/core/themes/base_colors.dart';
import 'package:news_appp/core/themes/bloc/states.dart';
import 'package:news_appp/core/themes/dark_colors.dart';
import 'package:news_appp/core/themes/light_colors.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit():super(InitThemeState());
  BaseColors colors = LightColors();
   changeTheme(){
    emit(InitThemeState());
    colors = colors is LightColors ? DarkColors():LightColors();
    emit(ChangeThemeState());
  }
}