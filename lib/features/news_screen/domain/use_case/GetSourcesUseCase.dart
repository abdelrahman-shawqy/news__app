import 'package:fpdart/fpdart.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/Failure.dart';
import '../repository_sources/remot_sources_repository.dart';

class GetSourcesUseCase {
  GetSourcesUseCase(this.rmoteSourcesRepository);

  final RemoteSourcesRepository rmoteSourcesRepository;
  Future<Either<Failure,SourcesResponseModel>> call (String categoryId ) {
    final sources = rmoteSourcesRepository.getSourcesData(categoryId);
    return sources ;
  }
}
