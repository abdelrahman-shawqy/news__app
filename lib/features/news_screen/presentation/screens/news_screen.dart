import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/dependency%20_njection/di.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/core/widgets/app_bar.dart';
import 'package:news_appp/core/widgets/drawer/app_drawer.dart';
import 'package:news_appp/features/news_screen/presentation/controllers/articles/articles_cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controllers/sources/sources_cubit.dart';
import 'package:news_appp/features/news_screen/presentation/widgets/sources_tap.dart';
import '../widgets/news_component.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key, required this.categoryLable});

  final String categoryLable;


  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBarr(title: categoryLable.tr()),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> getIt<SourcesCubit>()..getSources(categoryLable)),
            BlocProvider(create: (context) => getIt<ArticlesCubit>()),
          ],
          child: Column(

            children: [
              SourcesTap(
                categoryLable: categoryLable,
              ),
              SizedBox(height: 16),
              NewsComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
