import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AxiosClient {
  Dio _dio;

  AxiosClient({BaseOptions? options}) : _dio = Dio(options) {
    _dio = Dio(options ?? BaseOptions());
    // 添加其他的配置，如请求拦截器、响应拦截器等
    // 设置默认的 baseUrl
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        final apiUrl = dotenv.env['BASE_URL'];

        print('API URL: $apiUrl');
        options.baseUrl = apiUrl!;
        // 添加其他请求头
        options.headers['x-client-type'] = 'android';
        handler.next(options);
      },
    ));
  }

  Future<dynamic> request({
    String method = 'get',
    String url = '',
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    try {
      Response<Map<String, dynamic>> response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method, headers: headers),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        ApiResponse responseData =
            ApiResponse.fromJson(response.data as Map<String, dynamic>);
        return responseData.data ?? responseData.code;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 可以根据需要添加其他的辅助方法，如 get、post、put、delete 等

  // 可以根据需要添加其他的辅助方法，如设置请求头、处理错误信息等
}

class ApiResponse {
  final int code;
  final String message;
  final dynamic data;

  ApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
