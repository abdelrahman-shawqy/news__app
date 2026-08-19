import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_appp/core/constants/app_images.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/features/home_screen/data/category_model.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key});

  final List<CategoryModel>categoryModel = CategoryModel.categoryModel;
  @override
  Widget build(BuildContext context) {
    bool isEnglish=context.locale==Locale('en');
    return ListView.separated(
      shrinkWrap: true,
        physics:  NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Stack(
      alignment: index.isEven?Alignment.bottomRight:Alignment.bottomLeft,
      children: [
        ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(24),
            child: Image.asset(categoryModel[index].image)),
        Padding(
          padding:  EdgeInsets.only (bottom: 130, right:index.isEven? 20:0,left: index.isEven?0:20 ),
          child: Text(categoryModel[index].label.tr(),style: AppTextStyles.b700LabelCategoryDark,),
        ),
        Padding(
          padding:  EdgeInsets.only(right:index.isEven? 16:0,left: index.isEven?0:16,bottom: 16),
          child: Container(
            height: 54,
            width: 169,
           // padding: EdgeInsets.only(right: 2),
            decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadiusGeometry.circular(84)
            ),
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: isEnglish?index.isOdd:index.isEven,
                    child: Image.asset(isEnglish?AppImages.arrow_left_dark:AppImages.arrow_right_dark)),
                Padding(
                  padding: index.isEven? EdgeInsets.only(left:16,right: 1):EdgeInsets.only(left:1,right: 16),
                  child: Text("viewAll".tr(),style: AppTextStyles.m500Dark,),
                ),
                Visibility(
                  visible: isEnglish?index.isEven:index.isOdd,
                    child: Image.asset(isEnglish?AppImages.arrow_right_dark:AppImages.arrow_left_dark))
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
