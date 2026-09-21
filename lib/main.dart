import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'core/bloc/observer.dart';
import 'core/dependency _njection/di.dart';
import 'core/localization/app_localization.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/bloc/cubit.dart';
import 'core/themes/bloc/states.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SourceModelAdapter());
  Hive.registerAdapter(ArticlesModelAdapter());
  Hive.registerAdapter(SourceModelArticleAdapter());
  Hive.registerAdapter(ArticleAdapter());

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
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
