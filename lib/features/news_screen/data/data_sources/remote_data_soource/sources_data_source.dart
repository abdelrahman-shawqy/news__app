import 'package:dio/dio.dart';
import 'package:news_appp/core/network/api_helper.dart';
class SourcesDataSource {
  SourcesDataSource(this.apiHelper);
  final ApiHelper apiHelper;

  Future<Response> getSourecesData(String categoryId)  async{
    try {
      final response = await apiHelper.getData(
          "/v2/top-headlines/sources", {
        'apiKey': '004e8fada0a14248a19da201635ea1ae',
        'category': categoryId,
      });

      return response;
    } on DioException catch(e) {
      print('the exception from SourcesDataSource class is  =======#########');
      print('${e.message}');
      print('${e.type}');
      print('###############');
      rethrow ;
    }
  }
}
