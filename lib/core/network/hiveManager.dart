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
static Future<void> saveSources(SourcesResponse sourcesResponse,String catId)async{
  var box = await _openSourcesBox();
  await box.put("sources-$catId", sourcesResponse);
}
static Future<SourcesResponse?> getSources(String catId )async{
  var box= await _openSourcesBox();
  return box.get("sources-$catId");
}
static Future<void>deleteSources( String catId)async{
  var box= await _openSourcesBox();
  return box.delete("sources-$catId");
}

/////////////////////////

  static Future<Box<NewsDataResponse>>_openNewsBox()async{
    if(!Hive.isBoxOpen(_newsBoxName)){
      return Hive.openBox<NewsDataResponse>(_newsBoxName);
    }
    return Hive.box<NewsDataResponse>(_newsBoxName);
  }
  static Future<void> saveNews(NewsDataResponse newsDataResponse,String sourceId)async{
    var box = await _openNewsBox();
    await box.put("news-$sourceId", newsDataResponse);
  }
  static Future<NewsDataResponse?> getNews(String sourceId)async{
    var box= await _openNewsBox();
    return box.get("news-$sourceId");
  }
  static Future<void>deleteNews(String sourceId)async{
    var box= await _openNewsBox();
    return box.delete("news-$sourceId");
  }
}