import 'package:dio/dio.dart';

class ApiHelper {
   ApiHelper(this._dio);
  final Dio _dio ;
  Future<Response>getData(String endPoint, Map<String, dynamic> queryParameters) {
     return _dio.get(
       endPoint,
       queryParameters: queryParameters,
     );
   }
}
