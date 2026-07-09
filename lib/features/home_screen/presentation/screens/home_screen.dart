import 'package:flutter/material.dart';

import '../../../../core/themes/app_Colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarr(title: "Home",),
        body: Container(color: AppColors.primaryColorDark

        ),
      ),
    );
  }
}
