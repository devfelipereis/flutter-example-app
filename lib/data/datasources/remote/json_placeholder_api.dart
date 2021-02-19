import 'dart:async';

import 'package:dio/dio.dart';

import '../../../core/dio/jsonplaceholder_dio.dart';
import '../../models/post_model.dart';

class JsonPlaceholderApiDataSource {
  late Dio _dio;

  JsonPlaceholderApiDataSource({
    required JsonPlaceholderDioClient jsonPlaceholderDioClient,
  }) {
    _dio = jsonPlaceholderDioClient.instance;
  }

  Future<List<PostModel>> all() async {
    const url = "/posts";

    final responseData = await _dio.get<List>(url);
    return responseData.data
        .map((e) => PostModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
