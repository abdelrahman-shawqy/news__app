import 'package:hive/hive.dart';
import 'package:news_appp/core/models/news_data_response.dart';
import 'package:news_appp/core/models/sources_response.dart';

class CacheHelper{
static const String _sourcesBoxName="Sources";
static const String _newsBoxName="News";

static Future<Box<SourcesResponse>>_openSourcesBox()async{
  if(!Hive.isBoxOpen(_sourcesBoxName)){
   return Hive.openBox<SourcesResponse>(_sourcesBoxName);
  }
 return Hive.box<SourcesResponse>(_sourcesBoxName);
}
static Future<void> saveSources(SourcesResponse sourcesResponse)async{
  var box = await _openSourcesBox();
  box.put("Sources", sourcesResponse);
}
static Future<SourcesResponse?> getSources( )async{
  var box= await _openSourcesBox();
  box.get("Sources");
}
static Future<void>deleteSources( )async{
  var box= await _openSourcesBox();
  box.delete("Sources");
}

/////////////////////////

  static Future<Box<NewsDataResponse>>_openNewsBox()async{
    if(!Hive.isBoxOpen(_newsBoxName)){
      return Hive.openBox<NewsDataResponse>(_newsBoxName);
    }
    return Hive.box<NewsDataResponse>(_newsBoxName);
  }
  static Future<void> saveNews(NewsDataResponse newsDataResponse)async{
    var box = await _openNewsBox();
    box.put("News", newsDataResponse);
  }
  static Future<NewsDataResponse?> getNews()async{
    var box= await _openNewsBox();
    box.get("News");
  }
  static Future<void>deleteNews(String sourcesId)async{
    var box= await _openNewsBox();
    box.delete("News");
  }
}