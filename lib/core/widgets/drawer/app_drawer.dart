import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_appp/core/constants/app_images.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/widgets/drawer/theme_drawer_bottom_sheet.dart';
import 'package:news_appp/core/widgets/drawer/theme_icon_drawer.dart';

import '../../localization/app_localization.dart';
import '../../routing/routes.dart';
import 'local_icon_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale==AppLocalization.fallbackLocale;
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
            child: Center(child: Text("newsApp".tr(), style: AppTextStyles.b700)),
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
                  Text("goToHome".tr(), style: AppTextStyles.b700Drawer),
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
                ThemeIconDrawer(
                  title: "theme".tr(),
                  imageIcon: AppImages.themeIcon,
                  subTitle: "dark".tr(),
                  items: ["Dark".tr(),"Light".tr()],

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
                LocalIconDrawer(
                  title: "language".tr(),
                  imageIcon: AppImages.language_icon,
                  items: ["English","العربية"],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

}
