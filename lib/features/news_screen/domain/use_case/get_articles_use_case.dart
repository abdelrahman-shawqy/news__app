import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_articles_repository.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_articles/remote_articles_repository.dart';
import '../../data/models/articles_model.dart';

class GetArticlesUseCase {
  GetArticlesUseCase(this.remoteArticlesRepository,this.localArticlesRepository,this.internetConnection);
  final RemoteArticlesRepository remoteArticlesRepository ;
  final LocalArticlesRepository localArticlesRepository ;
  final InternetConnection internetConnection ;
  Future<Either<Failure, ArticlesModel>> call(String sourceId)async{
    final bool isConnected =await internetConnection.hasInternetAccess ;
    if(isConnected==true){
      print("###there are an internet data come from getRemoteArticlesData ####");
      return getRemoteArticlesData(sourceId);
    }
    else {
      print("###there are an internet data come from getLocalArticlesData ####");

      return getLocalArticlesData(sourceId);
    }
  }
  Future<Either<Failure,ArticlesModel>> getRemoteArticlesData(String sourceId)async{
     final RemoteArticles = await remoteArticlesRepository.getArticles(sourceId);
     return RemoteArticles ;
  }
  Future<Either<Failure, ArticlesModel>>getLocalArticlesData(String sourceId)async{
    var localArticles = await localArticlesRepository.getArticles(sourceId);

    return localArticles ;
  }

}