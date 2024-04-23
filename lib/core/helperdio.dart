import 'package:dio/dio.dart';

class DioHelpr {
  static Dio? dio;
  // ignore: non_constant_identifier_names
  static void Init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getDate(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token}) async {
    dio!.options.headers = {'lang': lang, 'authorization': token};
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postDate(
      {required String url,
      Map<String, dynamic>? query,
      String? lang,
      String? token,
      required Map<String, dynamic> date}) async {
    dio!.options.headers = {'lang': lang, 'token': token};
    return await dio!.post(url, queryParameters: query, data: date);
  }
}
