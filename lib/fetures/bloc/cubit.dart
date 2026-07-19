
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:news_appp/fetures/bloc/states.dart';

import '../../core/models/sources_response.dart';
import '../../core/network/constants.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitState());
  List<Sources>sources=[];
  Dio dio=Dio();
   getSources(String catId)async{
     emit(GetSourcesLoadingState());
    try{
      Response response = await dio.get("$BASEURL/v2/top-headlines/sources?apiKey=$APIKEY&category=$catId");
      SourcesResponse sourcesResponse=SourcesResponse.fromJson(response.data);
      sources=sourcesResponse.sources??[];
      emit(GetSourcesSuccessState());
    }
    catch(e){
      emit(GetSourcesErrorState());
      print("Something went wrong ");
    }
  }
}