import 'package:dio/dio.dart';

class AxiosClient {
  Dio _dio;

  AxiosClient({BaseOptions? options}) : _dio = Dio(options) {
    _dio = Dio(options ?? BaseOptions());
    // 添加其他的配置，如请求拦截器、响应拦截器等
  }

  Future<dynamic> request({
    String method = 'get',
    String url = '',
    dynamic data,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      Response response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method, headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Request failed with error: $e');
    }
  }

  // 可以根据需要添加其他的辅助方法，如 get、post、put、delete 等

  // 可以根据需要添加其他的辅助方法，如设置请求头、处理错误信息等
}
