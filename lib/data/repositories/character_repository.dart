import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/errors/server_failure.dart';
import '../../services/error_handler_service.dart';
import '../datasources/remote/character_api.dart';
import '../models/character_model.dart';

class CharacterRepository {
  CharacterApiDataSource characterApiDataSource;

  CharacterRepository({
    @required this.characterApiDataSource,
  });

  Future<List<CharacterModel>> all() async {
    try {
      final posts = await characterApiDataSource.all();
      return posts;
    } on DioError catch (e) {
      throw ServerFailure(ErrorHandlerService.getErrorMessage(e));
    }
  }
}
