import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/core/widgets/app_bar.dart';
import 'package:news_appp/core/widgets/drawer/app_drawer.dart';
import 'package:news_appp/features/news_screen/data/articles_model.dart';

import '../widgets/news_component.dart';

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
            NewsComponent(),
          ],
        ),
      ),
    );
  }
}
