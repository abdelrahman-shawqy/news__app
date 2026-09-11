part of 'news_screen_cubit.dart';

@immutable
sealed class NewsScreenState {}

final class NewsScreenInitial extends NewsScreenState {}

final class SourcesLoading extends NewsScreenState {}
final class SourcesSuccess extends NewsScreenState {}
final class SourcesError extends NewsScreenState {}

final class ArticlesLoading extends NewsScreenState {}
final class ArticlesSuccess extends NewsScreenState {}
final class ArticlesError extends NewsScreenState {}