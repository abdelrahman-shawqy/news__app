

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_appp/core/local/cache_helper.dart';
import 'package:news_appp/features/news_screen/data/data_sources/local_data_source/local_articles_data_source.dart';
import 'package:news_appp/features/news_screen/data/data_sources/local_data_source/local_source_data_source.dart';
import 'package:news_appp/features/news_screen/data/data_sources/remote_data_soource/articles_data_source.dart';
import 'package:news_appp/features/news_screen/data/data_sources/remote_data_soource/sources_data_source.dart';
import 'package:news_appp/features/news_screen/data/repository_impl/local_repository_impl/local_articles_repository_impl.dart';
import 'package:news_appp/features/news_screen/data/repository_impl/local_repository_impl/local_source_repository_impl.dart';
import 'package:news_appp/features/news_screen/data/repository_impl/remote_repository_impl/articles_repositoryi_mpl/remote_articles_repository_Impl.dart';
import 'package:news_appp/features/news_screen/data/repository_impl/remote_repository_impl/sources_repository_impl/remot_sources_repository_impl.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_articles_repository.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_source_repository.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_articles/remote_articles_repository.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_sources/remot_sources_repository.dart';
import 'package:news_appp/features/news_screen/domain/use_case/get_articles_use_case.dart';
import 'package:news_appp/features/news_screen/domain/use_case/get_sources_use_case.dart';
import 'package:news_appp/features/news_screen/presentation/controllers/articles/articles_cubit.dart';
import 'package:news_appp/features/news_screen/presentation/controllers/sources/sources_cubit.dart';

import '../network/api_helper.dart';
final getIt=GetIt.instance;
void configureDependencies(){
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: 'https://newsapi.org',
    connectTimeout: const Duration(seconds:30 ),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout:  const Duration(seconds: 30),
  )));

  getIt.registerLazySingleton<ApiHelper>(()=>ApiHelper(getIt<Dio>()));
  getIt.registerSingleton<HiveHelper>(HiveHelper());

  getIt.registerLazySingleton<SourcesDataSource>(()=>SourcesDataSource(getIt<ApiHelper>()));
  getIt.registerLazySingleton<LocalSourceDataSource>(()=>LocalSourceDataSource(getIt<HiveHelper>()));

  getIt.registerLazySingleton<RemoteSourcesRepository>(()=>RemoteSourcesRepositoryImpl(getIt<SourcesDataSource>(),getIt<LocalSourceDataSource>()));

  getIt.registerSingleton<InternetConnection>(InternetConnection());
  getIt.registerLazySingleton<LocalSourceRepository>(()=>LocalSourceRepositoryImpl(getIt<LocalSourceDataSource>()));

  getIt.registerLazySingleton<GetSourcesUseCase>(()=>GetSourcesUseCase(getIt<RemoteSourcesRepository>(),getIt<InternetConnection>(),getIt<LocalSourceRepository>()));

  getIt.registerFactory<SourcesCubit>(()=>SourcesCubit(getIt<GetSourcesUseCase>()));

  getIt.registerLazySingleton<ArticlesDataSource>(()=>ArticlesDataSource(getIt<ApiHelper>()));
  getIt.registerLazySingleton<LocalArticlesDataSource>(()=>LocalArticlesDataSource(getIt<HiveHelper>()));

  getIt.registerLazySingleton<RemoteArticlesRepository>(()=>RemoteArticlesRepositoryImpl(getIt<ArticlesDataSource>(),getIt<LocalArticlesDataSource>()));
  getIt.registerFactory<ArticlesCubit>(()=>ArticlesCubit(getIt<GetArticlesUseCase>()));
  getIt.registerLazySingleton<LocalArticlesRepository>(()=>LocalArticlesRepositoryImpl(getIt<LocalArticlesDataSource>()));
  getIt.registerLazySingleton<GetArticlesUseCase>(()=>GetArticlesUseCase(getIt<RemoteArticlesRepository>(),getIt<LocalArticlesRepository>(),getIt<InternetConnection>()));


}