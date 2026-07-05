import 'package:flutter/material.dart';
import 'package:news_appp/core/routing/routes.dart';

import '../../features/splash/screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic>onGenerateRoute(RouteSettings settings ){
    switch(settings.name){

      case Routes.splash :
        return MaterialPageRoute(
    builder: (_)=>const SplashScreen(),);



      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          ),
        );
    }

  }
}