import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/dio/breaking_bad_dio.dart';
import '../core/dio/jsonplaceholder_dio.dart';
import '../data/datasources/remote/character_api.dart';
import '../data/datasources/remote/json_placeholder_api.dart';
import '../data/repositories/character_repository.dart';
import '../data/repositories/json_placeholder_repository.dart';

/// dio clients
final jsonPlaceholderDioClient = Provider((ref) => JsonPlaceholderDioClient());
final breakingBadDioClient = Provider((ref) => BreakingBadDioClient());

/// datasources
final jsonPlaceholderApiDataSource = Provider(
  (ref) => JsonPlaceholderApiDataSource(
    jsonPlaceholderDioClient: ref.watch(jsonPlaceholderDioClient),
  ),
);

final characterApiDataSource = Provider(
  (ref) => CharacterApiDataSource(
    breakingBadDioClient: ref.watch(breakingBadDioClient),
  ),
);

/// repositories
final jsonPlaceHolderRepository = Provider(
  (ref) => JsonPlaceHolderRepository(
    jsonPlaceholderApiDataSource: ref.watch(jsonPlaceholderApiDataSource),
  ),
);

final characterRepository = Provider(
  (ref) => CharacterRepository(
    characterApiDataSource: ref.watch(characterApiDataSource),
  ),
);
