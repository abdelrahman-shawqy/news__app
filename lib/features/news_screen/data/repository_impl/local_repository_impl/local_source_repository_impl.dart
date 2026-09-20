import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/data_sources/local_data_source/local_source_data_source.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import 'package:news_appp/features/news_screen/domain/repository/local_repository/local_source_repository.dart';

class LocalSourceRepositoryImpl implements LocalSourceRepository {
  LocalSourceRepositoryImpl(this.localSourceDataSource);
  final LocalSourceDataSource localSourceDataSource ;

  @override
  Future<Either<Failure,List<SourceModel>>> getSources(String catId)async {
    var sources =await localSourceDataSource.getSources(catId);
    if(sources==null||sources.isEmpty){
      return Left(Failure(errorMessage: "There Are No Local Data Stored "));
    }
    else{
      return Right(sources);
    }
  }
}