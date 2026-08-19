import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/models/news_data_adapter.dart';
import 'core/models/source_responce_adapter.dart';
import 'core/network/internet_checker.dart';
import 'core/theming/bloc/cubit.dart';
import 'core/theming/bloc/states.dart';
import 'di.dart';
import 'fetures/bloc/observer.dart';
import 'fetures/home_screen/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  configureDependencies();
  print(await getIt<InternetConnectionss>().isConnected);

  await Hive.initFlutter();
  Hive.registerAdapter(SourcesResponseAdapter());
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(NewsDataResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());

  runApp(BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(builder: (context, state) {
        return  MyApp();
      },)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {HomeScreen.routName: (context) => HomeScreen()},
    );
  }
}
