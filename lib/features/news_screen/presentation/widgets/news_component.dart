import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_appp/core/themes/app_text_styles.dart';
import 'package:news_appp/core/themes/bloc/cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controllers/articles/articles_cubit.dart';

class NewsComponent extends StatelessWidget {
  const NewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.watch<ThemeCubit>().state.color;
    final colorStyle = AppTextStyles(color: color);
    final blocArticles = context.read<ArticlesCubit>();
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesSuccess) {
          print('${state.articles}###### DATA ###########');
          return state.articles.isEmpty
              ? Text('No Data', style: colorStyle.sourcesSelectedLableStyleB700)
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      height: 322,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: color.secondary, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            child:
                                state.articles[index].urlToImage == null ||
                                    state.articles[index].urlToImage!.isEmpty
                                ? Image.asset(
                                    'assets/images/un_avillable.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 220,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        '${state.articles[index].urlToImage}',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 220,
                                    placeholder: (context, url) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: color.secondary,
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Image.asset(
                                        'assets/images/un_avillable.png',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 220,
                                      );
                                    },
                                  ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            // TODO: handle null
                            state.articles[index].description ?? "",
                            style: colorStyle.sourcesSelectedLableStyleB700,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TODO: handle null
                              Text(
                                "By ${blocArticles.getAuthor(state.articles[index].author)}",
                                style: colorStyle.m500_12,
                              ),
                              Text(
                                state.articles[index].publishedAt?.substring(
                                      0,
                                      10,
                                    ) ??
                                    "not available ",
                                style: colorStyle.m500_12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: state.articles.length,
                  ),
                );
        } else if (state is ArticlesError) {
          return Center(
            child: Text(state.errorMessage, style: colorStyle.mBarTest),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: color.secondary),
          );
        }
      },
    );
  }
}
