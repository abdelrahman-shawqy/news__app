import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/core/widgets/app_bar.dart';
import 'package:news_appp/core/widgets/drawer/app_drawer.dart';
import 'package:news_appp/features/news_screen/presentation/widgets/sources_tap.dart';
import '../widgets/news_component.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key, required this.categoryLable});

  final String categoryLable;
  String sourceId ='abc-news-au';
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {


  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBarr(title: widget.categoryLable.tr()),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SourcesTap(
              categoryLable: widget.categoryLable,
              changeSelectedSource: (sourceId) {
                setState(() {
                  widget.sourceId = sourceId;
                  print('source id from NEWS screen is == ${sourceId}');
                });
              },
            ),
            SizedBox(height: 16),
            NewsComponent(sourceId: widget.sourceId),
          ],
        ),
      ),
    );
  }
}
