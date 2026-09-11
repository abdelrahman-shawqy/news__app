import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/data_sources/sources_data_source.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/repository_sources/remot_sources_repository.dart';


class RemoteSourcesRepositoryImpl extends RemoteSourcesRepository{
  RemoteSourcesRepositoryImpl(this.sourcesDataSource);
  SourcesDataSource sourcesDataSource ;

  @override
  Future<Either<Failure,SourcesResponseModel>> getSourcesData(String categoryId) async{
    try{
      final response = await sourcesDataSource.getSourecesData(categoryId);
      final sources  = SourcesResponseModel.fromJson(response.data);
      return Right(sources);

    }on DioException catch(e){

      print('there are Exception form RemoteSourcesRepositoryImpl ##### ');
      print(e.message);
      print('${e.type}');
      return Left(Failure(errorMessage: e.message??" Something went wrong From RemoteSourcesRepositoryImpl"));
    }

  }



}