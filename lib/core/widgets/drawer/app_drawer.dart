import 'package:flutter/material.dart';
import 'package:news_appp/core/constants/app_images.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';

import '../../routing/routes.dart';
import 'drawer_bottom_sheet.dart';
import 'icon_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * .75,
      color: AppColors.primaryColorDark,
      child: Column(
        children: [
          Container(
            height: 166,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Center(child: Text("News App", style: AppTextStyles.b700)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.homeScreen);
              },
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(AppImages.homeIcon),
                    size: 24,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text("Go To Home", style: AppTextStyles.b700Drawer),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              thickness: 2,
              indent: 16,
              endIndent: 16,
              // height: 24,
              color: AppColors.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                IconDrawer(
                  title: "Theme",
                  imageIcon: AppImages.themeIcon,
                  subTitle: "Dark",
                  function: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      builder: (context) =>
                          DrawerBottomSheet(
                            title1: "Light",
                            title2: "Dark",
                          ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    thickness: 2,
                    indent: 16,
                    endIndent: 16,
                    // height: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconDrawer(
                  title: "Language",
                  imageIcon: AppImages.language_icon,
                  subTitle: "English",
                  function: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      builder: (context) =>
                          DrawerBottomSheet(
                            title1: "English",
                            title2: "Arabic",
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
