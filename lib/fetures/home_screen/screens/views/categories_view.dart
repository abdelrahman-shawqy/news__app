import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/categoris_model.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key,required this.onCategoriesClick});

  var listCategories = CategorisModel.getCategoris();
  Function onCategoriesClick ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning\nHere is Some News For You",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  onCategoriesClick(listCategories[index]);
                },
                child: Stack(
                  alignment: index.isEven
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(18),
                      child: Image.asset(listCategories[index].image),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 16,
                        bottom: 16,
                        left: index.isEven ? 0 : 16,
                      ),
                      child: Column(
                        crossAxisAlignment: index.isEven
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          Text(
                            listCategories[index].label,
                            style: GoogleFonts.inter(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 55),
                          Container(
                            padding: EdgeInsets.only(
                              left: index.isEven ? 16 : 0,
                              right: index.isEven ? 0 : 16,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff7f7f7f),
                              borderRadius: BorderRadius.circular(84),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Visibility(
                                  visible: index.isOdd,
                                  child: Image.asset(
                                    "assets/images/arrow_left.png",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 6,
                                    left: index.isEven ? 0 : 6,
                                  ),
                                  child: Text(
                                    "View All",
                                    style: GoogleFonts.inter(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: index.isEven,
                                  child: Image.asset(
                                    "assets/images/arrow_right.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: listCategories.length,
            ),
          ],
        ),
      ),
    );
  }
}
