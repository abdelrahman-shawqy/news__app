
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'articles_model.g.dart';
@HiveType(typeId: 1)
class ArticlesModel extends HiveObject with EquatableMixin {
  ArticlesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  @HiveField(0)
  final String status;
  @HiveField(1)
  final int totalResults;
  @HiveField(2)
  final List<Article> articles;
  factory ArticlesModel.fromJson(Map<String,dynamic>json){
    return ArticlesModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
        articles : (json['articles'] as List).map((e)=>Article.fromJson(e)).toList(),
    );
  }
  
  Map<String,dynamic>toJson(){
    return{
      'status' :status ,
      'totalResults': totalResults,
      'articles' : articles.map((e)=>e.toJsonArticle()).toList()
    };
  }
  @override
  List<Object?> get props => [status,totalResults,articles];
}
@HiveType(typeId: 2)
class Article extends HiveObject with EquatableMixin{
  @HiveField(0)
  final SourceModelArticle source ;
  @HiveField(1)
  final String? author ;
  @HiveField(2)
  final String? title ;
  @HiveField(3)
  final String? description ;
  @HiveField(4)
  final String? url ;
  @HiveField(5)
  final String? urlToImage ;
  @HiveField(6)
  final String? publishedAt ;
  @HiveField(7)
  final String? content ;
  Article({required this.source, this.author, this.title, this.description, this.url,this.urlToImage,
    this.publishedAt, this.content});
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      source:SourceModelArticle.fromJson(json['source']),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String ? ,
      urlToImage: json['urlToImage'] as String ?,
      publishedAt: json['publishedAt'] as String ?,
      content:  json['content'] as String ?
    );
  }
  Map<String,dynamic>toJsonArticle(){
    return{
      'source' :source.toJsonSourceArticle() ,
      'author' : author,
      'title' : title,
      'description' : description,
      'url' : url ,
      'urlToImage' :urlToImage ,
      'publishedAt' : publishedAt ,
      'content' : content,
    };
  }
  @override
  List<Object?> get props => [source,author,title,description,url,urlToImage,publishedAt,content];

}
@HiveType(typeId: 3)
class SourceModelArticle extends HiveObject with EquatableMixin{
  @HiveField(0)
  final String? id ;
  @HiveField(1)
  final String? name ;
  SourceModelArticle({this.id, this.name});
  @override
  List<Object?> get props => [id,name];
  factory SourceModelArticle.fromJson(Map<String,dynamic>json){
    return SourceModelArticle(
      id: json['id'] as String ?,
      name: json['name']as String ?
    );
  }
   Map<String,dynamic>toJsonSourceArticle(){
    return {
      'id':id,
      'name' :name
    };
  }
}
