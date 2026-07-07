import 'package:flutter/material.dart';
import 'package:news_appp/core/routing/routes.dart';
import 'package:news_appp/features/news/presentation/screens/home_screen.dart';

import '../../features/splash_screen/presentation/screen/splash_screen.dart';


class AppRouter {
  static Route<dynamic>onGenerateRoute(RouteSettings settings ){
    switch(settings.name){

      case Routes.splash :
        return MaterialPageRoute(
    builder: (_)=>const SplashScreen(),);



      case Routes.homeScreen :
        return MaterialPageRoute(
          builder: (_)=>const HomeScreen(),);



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