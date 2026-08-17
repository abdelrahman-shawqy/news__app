import 'package:news_appp/core/models/news_data_response.dart';
import 'package:news_appp/core/models/sources_response.dart';

abstract class HomeLocalRepo {
Future<List<Sources>>getSources(String catId);
Future<List<Articles>>getNewsData(String sourcesId);
}