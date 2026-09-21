import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/core/themes/bloc/states.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
    Timer(const Duration(milliseconds: 3200), () {
      if (mounted) {
        _controller.reverse().then((_) {
          Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(

  builder: (context, state) {
    final  isDark = context.read<ThemeCubit>().changeImagesThemeForSplashScreen;
    var color = context.watch<ThemeCubit>().state.color ;
    return Scaffold(
      backgroundColor: color.primary,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 339),
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    isDark == false?
                    AppImages.splashLogo:AppImages.splashLogoDark,
                    height: 298,
                    width: 298,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Image.asset(
                  isDark == false
                      ? AppImages.splashBranding: AppImages.splashBrandingDark,
                  height: 85,
                  width: 214,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
