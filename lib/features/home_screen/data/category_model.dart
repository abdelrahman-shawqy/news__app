import 'package:easy_localization/easy_localization.dart';
import 'package:news_appp/core/constants/app_images.dart';

class CategoryModel {
  String id ;
  String label ;
  String image ;
  CategoryModel({required this.id,required this.label,required this.image});

  static List<CategoryModel>categoryModel=[
    CategoryModel(
      id: "general",
      label: "general".tr(),
      image: AppImages.generalDark
    ),
    CategoryModel(
      id: "business",
      label: "business".tr(),
      image: AppImages.busniessDark
    ),
    CategoryModel(
        id: "sport",
        label: "sport".tr(),
        image: AppImages.sportDark
    ),
    CategoryModel(
        id: "technology",
        label: "technology".tr(),
        image: AppImages.technologyDark
    ),
    CategoryModel(
        id: "science",
        label: "science".tr(),
        image: AppImages.scienceDark
    ),
    CategoryModel(
        id: "health",
        label: "health".tr(),
        image: AppImages.healthDark
    ),
    CategoryModel(
        id: "entertainment",
        label: "entertainment".tr(),
        image: AppImages.entertainmentDark
    ),
  ];
}