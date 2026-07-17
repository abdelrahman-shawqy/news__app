import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/api_manager.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.sourceId});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getData(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("SomeThing went wrong");
        } else {
          var articlesList = snapshot.data?.articles ?? [];
          if (articlesList.isEmpty) {
            return Center(child: Text("No Data"));
          }
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: articlesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  //height: 322,
                  //width: double.infinity,
                  child: Column(
                    children: [
                      Image.network(
                        articlesList[index].urlToImage ?? "",
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(articlesList[index].title ?? "",style: GoogleFonts.aboreto(
                        fontSize: 16,fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(articlesList[index].description ?? "",style: GoogleFonts.inter(
                          fontSize: 14,fontWeight: FontWeight.w400,
                          color: Colors.grey
                      ),
                      maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BY:${getAuthor(articlesList[index].author)}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(articlesList[index].publishedAt?.substring(0,10) ?? ""),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },

    );
  }
  String getAuthor(String? author) {
    if (author == null || author.isEmpty) {
      return "Unknown";
    }

    if (author.startsWith("http")) {
      return "Unknown";
    }

    return author
        .trim()
        .split(" ")
        .take(2)
        .join(" ");
  }
}
