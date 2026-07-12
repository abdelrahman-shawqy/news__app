import 'package:flutter/material.dart';
import 'package:news_appp/core/themes/app_Colors.dart';

import '../../constants/app_images.dart';
import '../../themes/app_text_styles.dart';

class DrawerBottomSheet extends StatelessWidget {
  const DrawerBottomSheet({super.key,required this.title1,required this.title2});
final String title1;
final String title2;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*0.5,
      width: double.infinity,
      color: AppColors.primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title1,style: AppTextStyles.b700Drawer),
                Icon(Icons.gpp_good_outlined,color: AppColors.primaryColor,
                  size: 24,)
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title2,style: AppTextStyles.b700Drawer),
                Icon(Icons.gpp_good_outlined,color: AppColors.primaryColor,
                  size: 24,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
