import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../themes/app_Colors.dart';
import '../../themes/app_text_styles.dart';

class IconDrawer extends StatelessWidget {
  const IconDrawer({
    super.key,
    required this.title,
    required this.imageIcon,
    required this.subTitle,
    required this.function,
  });

  final String title;

  final String subTitle;

  final String imageIcon;
  final void Function()function ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage(imageIcon),
              size: 24,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 8),
            Text(title, style: AppTextStyles.b700Drawer),
          ],
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: AppColors.primaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subTitle, style: AppTextStyles.b700Drawer),
                  ImageIcon(
                    AssetImage(AppImages.arrow_down_icon),
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          onTap: function
        ),
      ],
    );
  }
}
