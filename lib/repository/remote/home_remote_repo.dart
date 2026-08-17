import 'package:news_appp/core/models/sources_response.dart';

import '../../core/models/news_data_response.dart';

abstract class HomeRemoteRepo {

 Future<List<Sources>> getSources(String catId);
 Future<List<Articles>> getNewsData(String sourceId);
}