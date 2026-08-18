import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'constants.dart';
@lazySingleton
class ApiManager {
  Dio _dio =Dio();
  ApiManager(){
    _dio.options=BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type' : 'application/json',
      "x-api-key":APIKEY
      },
    );
  }
  Future<Response> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers ,
  }) async {
    try{
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: headers!=null?Options(headers: headers):null,
      );
      return response ;
    }catch(e){
      throw "$e";
    }
  }

  Future<Response> post<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers ,

  }) async {
   try{
     final response = await _dio.post(
       endpoint,
       data: data,
       queryParameters: queryParameters,
       options: headers!=null?Options(headers: headers):null,
     );
     return response ;
   }
   catch(e){
     throw "$e";
   }
  }
}
