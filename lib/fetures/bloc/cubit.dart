import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_appp/core/network/internet_checker.dart';
import 'package:news_appp/di.dart';

import 'package:news_appp/fetures/bloc/states.dart';

import '../../core/models/news_data_response.dart';
import '../../core/models/sources_response.dart';
import '../../core/network/constants.dart';
import '../../repository/local/home_local_repo.dart';
import '../../repository/remote/home_remote_repo.dart';

@injectable
class HomeCubit extends Cubit<HomeStates> {
  HomeRemoteRepo homeRemoteRepo;
  HomeLocalRepo homeLocalRepo;
  InternetConnectionss internetConnectionss;

  HomeCubit(this.homeRemoteRepo, this.homeLocalRepo, this.internetConnectionss)
    : super(HomeInitState());

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;

  changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSource());
    getNewsData();
  }

  getNewsData() async {
    try {
      emit(GetNewsDataLoadingState());
      final isConnected = await internetConnectionss.isConnected;
      articles = isConnected
          ? await homeRemoteRepo.getNewsData(sources[selectedIndex].id ?? "")
          : await homeLocalRepo.getNewsData(sources[selectedIndex].id ?? "");
      emit(GetNewsDataSuccessState());
    } catch (e) {
      emit(GetNewsDataErrorState());

      print("something went wrong");
    }
  }

  getSources(String catId) async {
    emit(GetSourcesLoadingState());
    try {
      final isConnected = await internetConnectionss.isConnected;

      sources = isConnected
          ? await homeRemoteRepo.getSources(catId)
          : await homeLocalRepo.getSources(catId);
      emit(GetSourcesSuccessState());
      getNewsData();
    } catch (e) {
      emit(GetSourcesErrorState());
      print("Something went wrong ");
    }
  }
}
