import 'package:news_appp/core/local/cache_helper.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';

class LocalArticlesDataSource {
  LocalArticlesDataSource(this.hiveHelper);
  final HiveHelper hiveHelper;
  Future<void> saveArticles(ArticlesModel articlesModel,String sourceId)async{
    print("### the data is succesfully saved from  LocalArticlesDataSource ###");
    print("from LocalArticlesDataSource the data is alrady saved ${articlesModel.articles.length}");
    return await hiveHelper.saveArticles(articlesModel, sourceId);
  }
  Future<ArticlesModel?> getArticles(String sourceId)async{
    final articles = await hiveHelper.getArticles(sourceId);
    print("from LocalArticlesDataSource the data is alrady saved in function getArticles ${articles?.articles.length}");

    return articles;
  }
}