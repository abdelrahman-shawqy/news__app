import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'package:news_appp/features/news_screen/domain/use_case/get_articles_use_case.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.getArticlesUseCase) : super(ArticlesLoading());

  final GetArticlesUseCase getArticlesUseCase ;
  Future <void>getArticles(String sourceId)async{
    final article = await getArticlesUseCase.call(sourceId);
    article.fold((error){
      emit(ArticlesError(error.errorMessage));
    }, (success){
      emit(ArticlesSuccess(success.articles));
    });
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
