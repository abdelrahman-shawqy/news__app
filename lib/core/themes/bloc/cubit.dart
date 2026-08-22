import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/base_colors.dart';
import 'package:news_appp/core/themes/bloc/states.dart';
import 'package:news_appp/core/themes/dark_colors.dart';
import 'package:news_appp/core/themes/light_colors.dart';


class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(InitThemeStates());

  void changeTheme() {
    late BaseColors newColor = state.color is LightColors
        ? DarkColors()
        : LightColors();
    emit(ChangeThemeStates(newColor));
  }
}
