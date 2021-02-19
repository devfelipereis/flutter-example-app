import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_certificate_pinning/certificate_pinning_interceptor.dart';

class JsonPlaceholderDioClient {
  late Dio _dio;

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
    ///
    _dio.interceptors.add(CertificatePinningInterceptor([
      '27:9B:88:6D:65:D6:F1:09:46:7F:E2:21:70:DA:AC:32:69:B8:0E:CB:DB:F6:77:AA:2E:68:3D:1F:68:A8:DF:80'
    ]));
  }
}
