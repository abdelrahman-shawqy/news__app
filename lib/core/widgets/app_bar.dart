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
        backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,size: 24,weight: 24,color: Theme.of(context).colorScheme.onPrimary,))
      ),
        title: Text(title,style: Theme.of(context).textTheme.displayLarge),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(onPressed: (){},
                icon: Icon(Icons.search,size: 24,weight: 24,color: Theme.of(context).colorScheme.onPrimary,)),
          )],
      );

  }
  @override
  Size get preferredSize => const Size.fromHeight(72);
}
