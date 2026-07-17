import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_appp/fetures/home_screen/screens/views/categories_view.dart';
import 'package:news_appp/fetures/home_screen/screens/views/resources_view.dart';

import '../../../core/models/categoris_model.dart';
import '../../../core/network/api_manager.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: InkWell(
          onTap: (){
            selectedCategorie=null;
            Navigator.pop(context);
            setState(() {

            });
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Home",
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 24,
                weight: 24,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: selectedCategorie != null
          ? SourcesView(catId:selectedCategorie!.id ,)
          : CategoriesView(onCategoriesClick: onCategoriesClick),
    );
  }

  CategorisModel? selectedCategorie;

  onCategoriesClick(CategorisModel categorie) {
    selectedCategorie = categorie;
    setState(() {

    });
  }
}
