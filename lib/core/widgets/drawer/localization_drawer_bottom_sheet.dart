import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_appp/core/themes/app_Colors.dart';

import '../../constants/app_images.dart';
import '../../themes/app_text_styles.dart';

class LocalizationDrawerBottomSheet extends StatelessWidget {
  const LocalizationDrawerBottomSheet({
    super.key,
    required this.title1,
    required this.title2,
  });
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    bool isEnglish=context.locale==Locale('en');
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      color: AppColors.primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                context.setLocale(Locale('en'));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title1, style: AppTextStyles.b700Drawer),

                  isEnglish?Icon(
                    Icons.gpp_good_outlined,
                    color: AppColors.primaryColor,
                    size: 24
                  ):SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: (){
                context.setLocale(Locale("ar"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title2, style: AppTextStyles.b700Drawer),
                  isEnglish?SizedBox():Icon(
                    Icons.gpp_good_outlined,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
