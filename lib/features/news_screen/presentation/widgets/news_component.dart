import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/dependency%20_njection/di.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/data/models/ar_model.dart';
import 'package:news_appp/features/news_screen/presentation/controller/articles/articles_cubit.dart';

class NewsComponent extends StatelessWidget {
   NewsComponent({super.key,required this.sourceId});
   final String sourceId ;

   @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle = AppTextStyles(color: color);

    return BlocProvider(
  create: (context) => getIt<ArticlesCubit>()..getArticles(sourceId),
  child: BlocBuilder<ArticlesCubit, ArticlesState>(
  builder: (context, state) {
    print('source id from NewsComponent  is == ${sourceId}');
    switch(state){
      case ArticlesLoading():
        return Center(child: CircularProgressIndicator(),);
      case ArticlesSuccess():
        print('${state.articles}###### DATA ###########');
        return state.articles.isEmpty ? Text('No Data',style: colorStyle.sourcesSelectedLableStyleB700,): Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              height: 322,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: color.secondary, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.network(
                      // TODO: handle null
                      '${state.articles[index].urlToImage??""}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    // TODO: handle null
                    state.articles[index].description??"",
                    style: colorStyle.sourcesSelectedLableStyleB700,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TODO: handle null
                      Text("By ${state.articles[index].author}",style: colorStyle.m500_12,),
                      Text(state.articles[index].publishedAt?.substring(0,10)??"not available ",style: colorStyle.m500_12,),
                    ],
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: state.articles.length,
          ),
        );
      case ArticlesError():
        return Center(child: Text(state.errorMessage,style:  colorStyle.mBarTest,),);
    }
    
  },
),
);
  }
}
