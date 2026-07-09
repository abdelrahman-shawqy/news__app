import 'package:flutter/material.dart';

import '../themes/app_Colors.dart';
import '../themes/app_text_styles.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarr({super.key,required this.title });
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 72,
        backgroundColor: AppColors.primaryColorDark,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Icon(Icons.menu,size: 24,weight: 24,color: AppColors.primaryColor,),
        ),
        title: Center(child: Text(title,style: AppTextStyles.mBarDark)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Icon(Icons.search,size: 24,weight: 24,color: AppColors.primaryColor,),
          )],
      );

  }
  @override
  Size get preferredSize => const Size.fromHeight(72);
}
