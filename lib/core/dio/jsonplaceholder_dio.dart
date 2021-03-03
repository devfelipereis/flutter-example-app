import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonPlaceholderDioClient {
  Dio _dio;

  JsonPlaceholderDioClient() {
    _dio = Dio(baseOptions());
    addInterceptors();
  }

  Dio get instance => _dio;

  BaseOptions baseOptions() {
    return BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      baseUrl: env['JSON_PLACEHOLDER_API_URL'],
    );
  }

  void addInterceptors() {
    // _dio.interceptors.add(LogInterceptor());
    // _dio.interceptors.add(tokenInterceptor());
  }
}
