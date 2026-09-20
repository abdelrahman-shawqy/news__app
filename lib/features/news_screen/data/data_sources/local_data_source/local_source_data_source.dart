import 'package:news_appp/core/local/cache_helper.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';

class LocalSourceDataSource {
  LocalSourceDataSource(this.hiveHelper);
  final HiveHelper hiveHelper;

  Future<void> saveSources(List<SourceModel> sourceModel,String catId){
    return hiveHelper.saveSource(sourceModel, catId);
  }

  Future<List<SourceModel>?> getSources(String catId){
    return  hiveHelper.getSource(catId);
  }

  Future<void> deleteSources(String catId){
    return hiveHelper.deleteSources(catId);
  }
}