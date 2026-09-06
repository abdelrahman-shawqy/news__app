
import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';

import '../../data/models/Sources_response_model.dart';

abstract class RemoteSourcesRepository {
  Future<Either<Failure,SourcesResponseModel>> getSourcesData(String categoryId);
}