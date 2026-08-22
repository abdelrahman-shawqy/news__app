import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appp/core/themes/app_Colors.dart';
import 'package:news_appp/core/themes/base_colors.dart';

import 'bloc/cubit.dart';

class AppTextStyles {
   BaseColors color;
  AppTextStyles({required this.color});

  static  TextStyle  mBar =GoogleFonts.inter(
fontWeight: FontWeight.w500,
fontSize: 20,
  color: AppColors.primaryColor ,
);
static TextStyle mBarDark=GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: AppColors.primaryColor,
);

static TextStyle m500=GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 24,
  color: AppColors.primaryColorDark,
);
static TextStyle m500Dark=GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 24,
  color: AppColors.primaryColor,
);
static TextStyle b700=GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: AppColors.primaryColorDark,
);
static TextStyle b700Drawer=GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 20,
  color: AppColors.primaryColor,
);
static TextStyle b700LabelCategoryDark=GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 40,
  color: AppColors.primaryColorDark,
);
    TextStyle get b700DrawerTest => GoogleFonts.inter(
     fontWeight: FontWeight.w700,
     fontSize: 20,
     color: color.secondary,
   );
    TextStyle get b700Test=>GoogleFonts.inter(
     fontWeight: FontWeight.w700,
     fontSize: 24,
     color: color.primary,
   );
    TextStyle get  m500Test=>GoogleFonts.inter(
     fontWeight: FontWeight.w500,
     fontSize: 24,
     color:color.secondary,
   );
     TextStyle get mBarTest =>GoogleFonts.inter(
     fontWeight: FontWeight.w500,
     fontSize: 20,
     color: color.secondary ,
   );
    TextStyle get b700LabelCategoryDarkTest=>GoogleFonts.inter(
     fontWeight: FontWeight.w500,
     fontSize: 40,
     color: color.primary,
   );
  }
