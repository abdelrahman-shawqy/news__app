
import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';


abstract class RemoteArticlesRepository {
  Future<Either<Failure,ArticlesModel>>getArticles(String sourceId);
}