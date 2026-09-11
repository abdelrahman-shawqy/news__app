
import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';


abstract class RemoteSourcesRepository {
  Future<Either<Failure,SourcesResponseModel>> getSourcesData(String categoryId);
}