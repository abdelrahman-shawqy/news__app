import 'package:dio/dio.dart';
import '../models/news_data_response.dart';
import '../models/sources_response.dart';
import 'constants.dart';

class ApiManager {
  static final Dio dio=Dio();
  static Future<NewsDataResponse?> getData(String sourceId)async{
    try{
      Response response = await dio.get("$BASEURL/v2/everything?apiKey=$APIKEY&sources=$sourceId");
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(response.data);
      return newsDataResponse ;
    }catch(e){
      print("Something went wrong");
    }
  }


  static Future<SourcesResponse?>getSources(String catId)async{
    try{
      Response response = await dio.get("$BASEURL/v2/top-headlines/sources?apiKey=$APIKEY&category=$catId");
      SourcesResponse sourcesResponse=SourcesResponse.fromJson(response.data);
      return sourcesResponse ;
    }
    catch(e){
      print("Something went wrong ");
    }
  }
}