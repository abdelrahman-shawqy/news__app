part of 'articles_cubit.dart';

@immutable
abstract class ArticlesState extends Equatable{}

final class ArticlesLoading extends ArticlesState {
  @override
  List<Object?> get props => [];
}

final class ArticlesSuccess extends ArticlesState {
  final List<Article>articles ;

  ArticlesSuccess(this.articles);

  @override
  List<Object?> get props => [articles];

}
final class ArticlesError extends ArticlesState {
  final String errorMessage ;

  ArticlesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
