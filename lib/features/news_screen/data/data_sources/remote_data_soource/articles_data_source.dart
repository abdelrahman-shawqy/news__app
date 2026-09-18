
import 'package:dio/dio.dart';
import 'package:news_appp/core/network/api_helper.dart';

class ArticlesDataSource {
  ArticlesDataSource(this.apiHelper);
  final ApiHelper apiHelper ;
 Future <Response> getArticlesData(String sourceId)async{
    try{
      final articlesResponse=await apiHelper.getData('/v2/everything', {
        'apiKey':'004e8fada0a14248a19da201635ea1ae',
        'sources':sourceId
      });
      return articlesResponse ;
    } on DioException catch(e){
      print("there is error from ArticlesDataSource ##########");
      print("${e.message}");
      print("${e.type}");
      rethrow ;
    }
  }
}