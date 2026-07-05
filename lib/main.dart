import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/app_Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      themeMode: ThemeMode.system,

      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
