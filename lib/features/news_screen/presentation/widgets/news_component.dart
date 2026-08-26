import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/data/articles_model.dart';

class NewsComponent extends StatelessWidget {
   NewsComponent({super.key});
  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle = AppTextStyles(color: color);
    var articles = ArticlesModel.articlesGet;
    return Expanded(
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
                child: Image.asset(
                  articles[index].urlToImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                articles[index].description,
                style: colorStyle.sourcesSelectedLableStyleB700,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("By ${articles[index].author}",style: colorStyle.m500_12,),
                  Text(articles[index].publishedAt,style: colorStyle.m500_12,),
                ],
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: articles.length,
      ),
    );
  }
}
