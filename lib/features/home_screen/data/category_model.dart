import 'package:easy_localization/easy_localization.dart';
import 'package:news_appp/core/constants/app_images.dart';

class CategoryModel {
  String id;

  String label;

  String imageDark;

  String image;

  CategoryModel({
    required this.id,
    required this.label,
    required this.imageDark,
    required this.image,
  });

  static List<CategoryModel> categoryModel = [
    CategoryModel(
      id: "general",
      label: "general",
      imageDark: AppImages.generalDark,
      image: AppImages.general,
    ),
    CategoryModel(
      id: "business",
      label: "business",
      imageDark: AppImages.busniessDark,
      image: AppImages.business,
    ),
    CategoryModel(
      id: "sport",
      label: "sport",
      imageDark: AppImages.sportDark,
      image: AppImages.sports,
    ),
    CategoryModel(
      id: "technology",
      label: "technology",
      imageDark: AppImages.technologyDark,
      image: AppImages.technology,
    ),
    CategoryModel(
      id: "science",
      label: "science",
      imageDark: AppImages.scienceDark,
      image: AppImages.science,
    ),
    CategoryModel(
      id: "health",
      label: "health",
      imageDark: AppImages.healthDark,
      image: AppImages.health,
    ),
    CategoryModel(
      id: "entertainment",
      label: "entertainment",
      imageDark: AppImages.entertainmentDark,
      image: AppImages.entertainment,
    ),
  ];
}
