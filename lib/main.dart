import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/observer.dart';
import 'core/localization/app_localization.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/app_Theme.dart';
import 'core/themes/bloc/cubit.dart';
import 'core/themes/bloc/states.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.startLocal,
      path: AppLocalization.path,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            return MyApp();
          },
        ),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //theme: AppTheme.LightTheme,
      //darkTheme: AppTheme.DarkTheme,
      //themeMode: ThemeMode.dark,

      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
