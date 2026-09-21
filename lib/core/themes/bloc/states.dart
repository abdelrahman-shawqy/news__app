import 'package:news_appp/core/themes/base_colors.dart';
import 'package:news_appp/core/themes/dark_colors.dart';

abstract class ThemeStates{
  final BaseColors color ;
  ThemeStates(this.color);
}

class InitThemeStates extends  ThemeStates {
  InitThemeStates():super(DarkColors());

}

class ChangeThemeStates extends ThemeStates {
  ChangeThemeStates (super.color);
}