import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/data_sources/local_data_source/local_source_data_source.dart';
import 'package:news_appp/features/news_screen/data/data_sources/remote_data_soource/sources_data_source.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/remote_repository/repository_sources/remot_sources_repository.dart';


class RemoteSourcesRepositoryImpl implements RemoteSourcesRepository{
  RemoteSourcesRepositoryImpl(this.sourcesDataSource,this.localSourceDataSource);
  final SourcesDataSource sourcesDataSource ;
  final LocalSourceDataSource localSourceDataSource ;
  @override
  Future<Either<Failure,List<SourceModel>>> getSourcesData(String categoryId) async{
    try{
      final response = await sourcesDataSource.getSourecesData(categoryId);
      final sources  = SourcesResponseModel.fromJson(response.data);
      localSourceDataSource.saveSources(sources.sources, categoryId);
      return Right(sources.sources);

    }on DioException catch(e){

      print('there are Exception form RemoteSourcesRepositoryImpl ##### ');
      print(e.message);
      print('${e.type}');
      return Left(Failure(errorMessage: e.message??" Something went wrong From RemoteSourcesRepositoryImpl"));
    }

  }



}