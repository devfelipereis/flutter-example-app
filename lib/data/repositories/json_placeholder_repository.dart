import 'dart:async';

import 'package:dio/dio.dart';

import '../../core/error/failures.dart';
import '../../services/error_handler_service.dart';
import '../datasources/remote/json_placeholder_api.dart';
import '../models/post_model.dart';

class JsonPlaceHolderRepository {
  JsonPlaceholderApiDataSource jsonPlaceholderApiDataSource;

  JsonPlaceHolderRepository({
    required this.jsonPlaceholderApiDataSource,
  });

  Future<List<PostModel>> all() async {
    try {
      final posts = await jsonPlaceholderApiDataSource.all();
      return posts;
    } on DioError catch (e) {
      throw ServerFailure(ErrorHandlerService.getErrorMessage(e));
    }
  }
}
