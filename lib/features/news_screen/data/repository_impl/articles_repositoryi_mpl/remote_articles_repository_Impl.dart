import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:news_appp/features/news_screen/data/data_sources/remote_data_soource/articles_data_source.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/repository_articles/remote_articles_repository.dart';

class RemoteArticlesRepositoryImpl extends RemoteArticlesRepository{
  RemoteArticlesRepositoryImpl(this.articlesDataSource);
  final ArticlesDataSource articlesDataSource ;

  @override
  Future<Either<Failure,ArticlesModel>>getArticles(String sourceId)async {
    try{
      final articlesResponse=await articlesDataSource.getArticlesData(sourceId);
      final articlesData = ArticlesModel.fromJson(articlesResponse.data);
      return Right(articlesData);
    }on DioException catch(e){
      print('there are Exception form RemoteArticlesRepositoryImpl ##### ');
      print(e.message);
      print('${e.type}');
      return Left(Failure(errorMessage:e.message??"Something went wrong from RemoteArticlesRepositoryImpl" ));
    }
  }
}