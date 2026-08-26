import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle=AppTextStyles(color: color);
    return TextField(
      cursorColor: color.secondary,
      cursorWidth: 2,
      cursorHeight: 20,
      cursorRadius: const Radius.circular(2),
      style: colorStyle.sourcesUnSelectedLableStyleB500,
      decoration: InputDecoration(

        hintText:'search'.tr(),
        hintStyle:colorStyle.mBarTest ,
        prefixIcon:Icon(Icons.search,color: color.secondary,),
        suffixIcon: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.close,color: color.secondary,)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color.secondary,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: color.secondary,
            width: 2,
          ),
        ),

      ),

    );
  }
}
