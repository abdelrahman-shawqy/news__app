import 'package:flutter/material.dart';
import 'package:news_appp/core/routing/routes.dart';
import 'package:news_appp/features/home_screen/presentation/screens/home_screen.dart';
import 'package:news_appp/features/search_features/presentation/screens/search_screen.dart';

import '../../features/news_screen/presentation/screens/news_screen.dart';
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

      case Routes.newsScreen :
        final categoryLable = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_)=> NewsScreen(categoryLable:categoryLable ,),);

      case Routes.searchScreen :
        return MaterialPageRoute(
          builder: (_)=> SearchScreen(),);



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