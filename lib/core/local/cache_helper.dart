import 'package:hive/hive.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
class HiveHelper {
  final String sourceBoxName = 'Sources';

  Future<Box<List<SourceModel>>> openSourceBox()async{
    if(Hive.isBoxOpen(sourceBoxName)){
      return Hive.box<List<SourceModel>>(sourceBoxName);
    }
    return Hive.openBox<List<SourceModel>>(sourceBoxName);
  }

  Future<void>saveSource(List<SourceModel> sourceModel,String catId)async {
    var box = await openSourceBox();
    box.put('source_$catId',sourceModel);
  }

  Future<List<SourceModel>?>getSource(String catId)async {
    var box = await openSourceBox();
    return await box.get('source_$catId');
  }

  Future<void> deleteSources(String catId)async{
    var box =await openSourceBox() ;
    box.delete('source_$catId');
  }
}

