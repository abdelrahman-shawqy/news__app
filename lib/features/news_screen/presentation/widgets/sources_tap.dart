import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/dependency%20_njection/di.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controller/articles/articles_cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controller/sources/sources_cubit.dart';

class SourcesTap extends StatelessWidget {
  SourcesTap({super.key, required this.categoryLable,});

  final String categoryLable;

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final blocArticles = context.read<ArticlesCubit>();
    final colorStyle = AppTextStyles(color: color);
    return BlocBuilder<SourcesCubit, SourcesState>(
      builder: (context, state) {
        switch(state) {
          case SourcesLoading():
            return Center(child: CircularProgressIndicator(color:color.secondary ,),);

          case SourcesSuccess():
            blocArticles.getArticles(state.sources[0].id);
            return DefaultTabController(
              length: state.sources.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: color.secondary,
                dividerColor: Colors.transparent,
                labelStyle: colorStyle.sourcesSelectedLableStyleB700,
                unselectedLabelStyle:
                colorStyle.sourcesUnSelectedLableStyleB500,
                tabs: state.sources
                    .map((e) => Tab(child: Text(e.name)))
                    .toList(),
                onTap: (name){
                  print("the tap  ########## =========${state.sources[name].id}");
                  blocArticles.getArticles(state.sources[name].id);
                },
              ),
            );
          case SourcesError():
            return Center(
              child: Text(
                state.errorMessage,
                style:  colorStyle.mBarTest,
              ),
            );
        }

      },
    );
  }
}
