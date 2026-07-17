import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/network/api_manager.dart';
import '../news_screen.dart';

class SourcesView extends StatefulWidget {
   SourcesView({super.key,required this.catId});
   String catId;
  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.catId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Some Thing went Worng "));
        } else {
          var dataLest = (snapshot.data?.sources ?? [])
              .where((e) => e.id != "abc-news")
              .toList();
          return Column(
            children: [
              DefaultTabController(
                length: dataLest.length,
                initialIndex: selectedIndex,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  onTap: (v){
                    selectedIndex=v;
                    setState(() {
                    });
                  },
                  labelStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize:16,
                      color: Colors.black
                  ),
                  unselectedLabelStyle:GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize:14,
                      color: Colors.black
                  ),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  tabs: dataLest.map((e) => Tab(child: Text(e.name ?? ""))).toList(),
                ),
              ),
              Expanded(
                child: NewsScreen(
                  sourceId:dataLest[selectedIndex].id??"",
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
