import 'package:flutter/material.dart';

import '../../../../core/themes/app_Colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/drawer/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBarr(title: "Home"),
        body: Container(
          color: AppColors.primaryColorDark,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning \nHere is Some News For You",
                  style: AppTextStyles.m500Dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
