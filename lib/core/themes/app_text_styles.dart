import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appp/core/themes/base_colors.dart';

import 'bloc/cubit.dart';

class AppTextStyles {
   BaseColors color;
  AppTextStyles({required this.color});


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

    TextStyle get sourcesSelectedLableStyleB700 =>GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: color.secondary,
    );
   TextStyle get sourcesUnSelectedLableStyleB500 =>GoogleFonts.inter(
     fontWeight: FontWeight.w500,
     fontSize: 14,
     color: color.secondary,
   );
   TextStyle get m500_12 =>GoogleFonts.inter(
     fontWeight: FontWeight.w500,
     fontSize: 12,
     color: Color(0xffA0A0A0),
   );

  }
