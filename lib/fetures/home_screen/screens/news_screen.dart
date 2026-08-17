import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/api_manager.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  //final String sourceId;

  @override
  Widget build(BuildContext context) {
   // var bloc = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var bloc = context.read<HomeCubit>();
        return bloc.articles.isEmpty?Center(child: Text("No data"),): ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: bloc.articles.length,
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
                            bloc.articles[index].urlToImage ?? "",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            bloc.articles[index].title ?? "",
                            style: GoogleFonts.aboreto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            bloc.articles[index].description ?? "",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "BY:${getAuthor(bloc.articles[index].author)}",
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                bloc.articles[index].publishedAt?.substring(
                                      0,
                                      10,
                                    ) ??
                                    "",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
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

    return author.trim().split(" ").take(2).join(" ");
  }
}
