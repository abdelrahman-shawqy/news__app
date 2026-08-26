import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/core/widgets/app_bar.dart';
import 'package:news_appp/core/widgets/drawer/app_drawer.dart';
import 'package:news_appp/features/news_screen/data/articles_model.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key, required this.categoryLable});

  final String categoryLable;

  List<String> sources = [
    "ABC News",
    "mbc",
    "masr",
    "mbc2",
    "gzera",
    "jklm",
    "bbc",
    "mbc",
    "masr",
    "mbc2",
    "gzera",
    "jklm",
  ];

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle = AppTextStyles(color: color);
    var articles = ArticlesModel.articlesGet;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBarr(title: categoryLable.tr()),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DefaultTabController(
              length: sources.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: color.secondary,
                dividerColor: Colors.transparent,
                labelStyle: colorStyle.sourcesSelectedLableStyleB700,
                unselectedLabelStyle:
                    colorStyle.sourcesUnSelectedLableStyleB500,
                tabs: sources.map((e) => Tab(child: Text(e))).toList(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}
