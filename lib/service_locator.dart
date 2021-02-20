import 'package:get_it/get_it.dart';

import 'core/dio/breaking_bad_dio.dart';
import 'core/dio/jsonplaceholder_dio.dart';
import 'data/datasources/remote/character_api.dart';
import 'data/datasources/remote/json_placeholder_api.dart';
import 'data/repositories/character_repository.dart';
import 'data/repositories/json_placeholder_repository.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  /// dio clients
  sl.registerLazySingleton<JsonPlaceholderDioClient>(
      () => JsonPlaceholderDioClient());
  sl.registerLazySingleton<BreakingBadDioClient>(() => BreakingBadDioClient());

  /// datasources
  sl.registerLazySingleton<JsonPlaceholderApiDataSource>(
      () => JsonPlaceholderApiDataSource(jsonPlaceholderDioClient: sl()));
  sl.registerLazySingleton<CharacterApiDataSource>(
      () => CharacterApiDataSource(breakingBadDioClient: sl()));

  /// repositories
  sl.registerLazySingleton<JsonPlaceHolderRepository>(
      () => JsonPlaceHolderRepository(jsonPlaceholderApiDataSource: sl()));
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepository(characterApiDataSource: sl()));
}
