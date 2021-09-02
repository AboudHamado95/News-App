import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
