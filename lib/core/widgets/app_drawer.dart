import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appp/core/theming/bloc/cubit.dart';
import 'package:news_appp/core/theming/light_colors.dart';

class AppDrawer extends StatelessWidget {
  Function onDrawerClicked;

  AppDrawer({super.key, required this.onDrawerClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(color: ThemeCubit.get(context).colors.primary),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(color: ThemeCubit.get(context).colors.socendry),
            child: Center(
              child: Text(
                "News App",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ThemeCubit.get(context).colors.primary,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                children: [
                  Icon(Icons.home, color: ThemeCubit.get(context).colors.socendry),
                  SizedBox(width: 3),
                  Text(
                    "Go To Home",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ThemeCubit.get(context).colors.socendry,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light Mood",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ThemeCubit.get(context).colors.socendry,
                  ),
                ),
                Switch(
                  value: ThemeCubit.get(context).colors is !LightColors,
                  onChanged: (value) {
                    print(value);
                    ThemeCubit.get(context).cahngeTheme();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
