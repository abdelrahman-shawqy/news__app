import 'package:injectable/injectable.dart';
import 'package:news_appp/core/models/news_data_response.dart';

import 'package:news_appp/core/models/sources_response.dart';

import '../../core/network/hiveManager.dart';
import 'home_local_repo.dart';
@Injectable(as:HomeLocalRepo )
class HomeLocalRepoImpl implements HomeLocalRepo {
  @override
  Future<List<Articles>> getNewsData(String sourcesId) async{
   var data = await  CacheHelper.getNews();
   return data?.articles??[];
  }

  @override
  Future<List<Sources>> getSources(String catId) async{
    var data = await  CacheHelper.getSources();
    return data?.sources??[];
  }

}