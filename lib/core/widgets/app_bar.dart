import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';

import '../themes/app_Colors.dart';
import '../themes/app_text_styles.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  const AppBarr({super.key,required this.title });
final String title;
  @override
  Widget build(BuildContext context) {
    var color = context.watch<ThemeCubit>().state.color;
    var styleColor = AppTextStyles(color: color);
    return AppBar(
        toolbarHeight: 72,
        backgroundColor: color.primary,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,size: 24,weight: 24,color: color.secondary,))
      ),
        title: Text(title.tr(),style: styleColor.mBarTest),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(onPressed: (){},
                icon: Icon(Icons.search,size: 24,weight: 24,color: color.secondary,)),
          )],
      );

  }
  @override
  Size get preferredSize => const Size.fromHeight(72);
}
