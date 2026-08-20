import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/localization/app_localization.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/app_Theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
    supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      startLocale: AppLocalization.startLocal,
      path: AppLocalization.path,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: ThemeMode.dark,

      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
