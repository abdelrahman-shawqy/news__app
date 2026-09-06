import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/domain/use_case/GetSourcesUseCase.dart';

part 'sources_state.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesCubit(this.getSourcesUseCase) : super(SourcesLoading());
  final GetSourcesUseCase getSourcesUseCase ;
   Future<void>getSources(String categoryId)async {
    final sources = await getSourcesUseCase.call(categoryId);
    sources.fold((error){
      emit(SourcesError(error.errorMessage));
    }, (success){
      emit(SourcesSuccess(success.sources));
    });
  }
}
