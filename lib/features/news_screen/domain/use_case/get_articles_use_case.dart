import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_articles/remote_articles_repository.dart';
import '../../data/models/articles_model.dart';

class GetArticlesUseCase {
  GetArticlesUseCase(this.remoteArticlesRepository);
  final RemoteArticlesRepository remoteArticlesRepository ;
  Future<Either<Failure,ArticlesModel>> getArticlesData(String sourceId){
     final articles =remoteArticlesRepository.getArticles(sourceId);
     return articles ;
  }

}