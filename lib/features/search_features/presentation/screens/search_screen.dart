import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/constants/app_images.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/data/articles_model.dart';
import 'package:news_appp/features/news_screen/presentation/widgets/news_component.dart';
import 'package:news_appp/features/search_features/presentation/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle=AppTextStyles(color: color);
    return Scaffold(
      backgroundColor: color.primary,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: 16,),
              NewsComponent(),


            ],
          ),
        ),
      ),
    );
  }
}
