
import 'package:equatable/equatable.dart';
class ArticlesModel extends Equatable {
  ArticlesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  final String status;
  final int totalResults;
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

class Article extends Equatable{
  final SourceModelArticle source ;
  final String? author ;
  final String? title ;
  final String? description ;
  final String? url ;
  final String? urlToImage ;
  final String? publishedAt ;
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

class SourceModelArticle extends Equatable{
  final String? id ;
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
