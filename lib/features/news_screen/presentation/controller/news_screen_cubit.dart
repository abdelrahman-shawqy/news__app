import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_appp/features/news_screen/data/models/Sources_response_model.dart';
import 'package:news_appp/features/news_screen/data/models/articles_model.dart';
import 'package:news_appp/features/news_screen/domain/use_case/get_sources_use_case.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  NewsScreenCubit(this.getSourcesUseCase) : super(NewsScreenInitial());
  final GetSourcesUseCase getSourcesUseCase ;
  List<SourceModel> sources = [];
  List<Article>articles = [];
  String errorMessage ="";
   Future <void>grtSources(String categoryId)async{
     emit(SourcesLoading());
     final  sourcesResponse =await getSourcesUseCase.call(categoryId);
     sourcesResponse.fold((e){
       errorMessage = e.errorMessage;
       emit(SourcesError());
     }, (s){
       sources = s.sources;
       emit(SourcesSuccess());
     });

   }



}
