import 'package:fpdart/src/either.dart';
import 'package:news_appp/features/news_screen/data/data_sources/local_data_source/local_articles_data_source.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_articles_repository.dart';

class LocalArticlesRepositoryImpl implements  LocalArticlesRepository {
  LocalArticlesRepositoryImpl(this.localArticlesDataSource);

  final LocalArticlesDataSource localArticlesDataSource ;


  @override
  Future<Either<Failure, ArticlesModel>> getArticles(String sourceId)async {
    final articles = await localArticlesDataSource.getArticles(sourceId);
    final articleList = articles?.articles ;
    print("### from LocalArticlesRepositoryImpl in func getArticles ${articleList?.length} ####");

    if(articleList==null||articleList.isEmpty){
      return Left(Failure(errorMessage: "There Are No Local Data"));
    }else{
      print("### the data is send to right in LocalArticlesRepositoryImpl  ###");
      return Right(articles!);
    }
  }
}