import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/constants/app_images.dart';
import 'package:news_appp/features/home_screen/presentation/widgets/home_category.dart';

import '../../../../core/themes/app_Colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/themes/bloc/cubit.dart';
import '../../../../core/themes/bloc/states.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/drawer/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final styleColor=AppTextStyles(color: color);
    return BlocBuilder<ThemeCubit, ThemeStates>(
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBarr(title: "home"),
        body: Container(
          color: color.primary,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "goodMorning".tr(),
                    style: styleColor.m500Test,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HomeCategory(),
              
                ],
              ),
            ),

          ),
        ),
      ),
    );
  },
);
  }
}
