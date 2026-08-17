import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_appp/core/models/news_data_response.dart';

import 'package:news_appp/core/models/sources_response.dart';

import '../../core/network/api_manager.dart';
import '../../core/network/constants.dart';
import '../../core/network/hiveManager.dart';
import 'home_remote_repo.dart';
  @Injectable(as: HomeRemoteRepo)
class HomeRemoteRepoImpl implements HomeRemoteRepo{
    ApiManager apiManager;
    HomeRemoteRepoImpl(this.apiManager);
  @override
  Future<List<Articles>> getNewsData(String sourceId)async {
    try {
      Response response = await apiManager.get(
       endpoint: "/v2/everything",
        queryParameters: {"sources":sourceId},
      );
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      await CacheHelper.saveNews(newsDataResponse);

      return newsDataResponse.articles??[] ;
    }catch(e){
      rethrow ;
    }
  }

  @override
  Future<List<Sources>> getSources(String catId)async {
    try{
      Response response = await apiManager.get(
        endpoint:"/v2/top-headlines/sources" ,
        queryParameters: {"category":catId},
      );
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      await CacheHelper.saveSources(sourcesResponse);
      return sourcesResponse.sources??[] ;
    }
    catch(e){
      rethrow ;

    }
  }

}