import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  Function onDrawerClicked ;
  AppDrawer({super.key,required this.onDrawerClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.70,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Center(child: Text("News App",style: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black),)),
          ),
          InkWell(
            onTap: (){
              onDrawerClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: Row(
                children: [
                  Icon(Icons.home,color: Colors.white,),
                  SizedBox(width: 3,),
                  Text("Go To Home",style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
