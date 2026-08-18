import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/features/home_screen/data/category_model.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/themes/app_text_styles.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key});

  final List<CategoryModel>categoryModel = CategoryModel.categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics:  NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(24),
            child: Image.asset(categoryModel[index].image)),
        Positioned(
          right: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(categoryModel[index].label,style: AppTextStyles.b700LabelCategoryDark,),
                const SizedBox(
                  height: 45,
                ),
                Positioned(
                  right: 50,
                  child: Container(
                    height: 54,
                    width: 169,
                    decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadiusGeometry.circular(84)
                    ),
                    child: Row(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 1),
                          child: Text("viewAll".tr(),style: AppTextStyles.m500Dark,),
                        ),
                        Image.asset(AppImages.arrow_right_dark)
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    ),
        separatorBuilder: (context,index)=>SizedBox(height: 16),
        itemCount: categoryModel.length);
  }
}
