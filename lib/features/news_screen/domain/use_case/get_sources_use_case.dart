import 'package:fpdart/fpdart.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_source_repository.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_sources/remot_sources_repository.dart';

class GetSourcesUseCase {
  GetSourcesUseCase(this.remoteSourcesRepository, this.internetConnection,this.localSourceRepository);

  final RemoteSourcesRepository remoteSourcesRepository;
  final InternetConnection internetConnection;
  final LocalSourceRepository localSourceRepository ;

  call(String categoryId) async {
    final bool isConnected = await internetConnection.hasInternetAccess;
    if(isConnected==true){
      return remoteCall(categoryId);
    }
    else{
      return localCall(categoryId);
    }
  }
  Future<Either<Failure, List<SourceModel>?>> localCall(String categoryId){
    final localSource= localSourceRepository.getSources(categoryId);
    return localSource  ;
  }
  Future<Either<Failure, List<SourceModel>>> remoteCall(String categoryId) {
    final remoteSources = remoteSourcesRepository.getSourcesData(categoryId);
    return remoteSources;
  }
}
