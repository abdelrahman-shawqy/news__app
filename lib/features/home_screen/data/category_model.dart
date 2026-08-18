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
      label: "general",
      image: AppImages.generalDark
    ),
    CategoryModel(
      id: "business",
      label: "business",
      image: AppImages.busniessDark
    ),
    CategoryModel(
        id: "sport",
        label: "sport",
        image: AppImages.sportDark
    ),
    CategoryModel(
        id: "technology",
        label: "technology",
        image: AppImages.technologyDark
    ),
    CategoryModel(
        id: "science",
        label: "science",
        image: AppImages.scienceDark
    ),
    CategoryModel(
        id: "health",
        label: "health",
        image: AppImages.healthDark
    ),
    CategoryModel(
        id: "entertainment",
        label: "entertainment",
        image: AppImages.entertainmentDark
    ),
  ];
}