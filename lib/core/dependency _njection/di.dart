

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_appp/features/news_screen/data/data_sources/sources_data_source.dart';
import 'package:news_appp/features/news_screen/data/sources_repository_impl/remot_sources_repository_impl.dart';
import 'package:news_appp/features/news_screen/domain/repository_sources/remot_sources_repository.dart';
import 'package:news_appp/features/news_screen/domain/use_case/GetSourcesUseCase.dart';
import 'package:news_appp/features/news_screen/presentation/controller/sources/sources_cubit.dart';

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
  getIt.registerLazySingleton<SourcesDataSource>(()=>SourcesDataSource(getIt<ApiHelper>()));
  getIt.registerLazySingleton<RemoteSourcesRepository>(()=>RemoteSourcesRepositoryImpl(getIt<SourcesDataSource>()));
  getIt.registerLazySingleton<GetSourcesUseCase>(()=>GetSourcesUseCase(getIt<RemoteSourcesRepository>()));
  getIt.registerFactory<SourcesCubit>(()=>SourcesCubit(getIt<GetSourcesUseCase>()));
}