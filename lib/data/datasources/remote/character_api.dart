import 'dart:async';

import 'package:dio/dio.dart';

import '../../../core/dio/breaking_bad_dio.dart';
import '../../models/character_model.dart';

class CharacterApiDataSource {
  late Dio _dio;

  CharacterApiDataSource({
    required BreakingBadDioClient breakingBadDioClient,
  }) {
    _dio = breakingBadDioClient.instance;
  }

  Future<List<CharacterModel>> all() async {
    const url = "/characters";

    final responseData = await _dio.get<List>(url);
    final data = responseData.data
        .map((e) => CharacterModel.fromMap(e as Map<String, dynamic>))
        .toList();

    return data;
  }

  Future<CharacterModel> find(int id) async {
    final url = "/characters/$id";

    final responseData = await _dio.get<Map<String, dynamic>>(url);
    return CharacterModel.fromMap(responseData.data);
  }
}
