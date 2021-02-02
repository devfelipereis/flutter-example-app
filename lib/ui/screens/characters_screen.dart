import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/character_model.dart';
import '../../providers/providers.dart';
import '../widgets/default_error.dart';
import '../widgets/default_loading.dart';

final charactersProvider = FutureProvider<List<CharacterModel>>(
  (ref) => ref.watch(characterRepository).all(),
);

class CharactersScreen extends ConsumerWidget {
  const CharactersScreen();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final characters = watch(charactersProvider);
    return characters.when(
      loading: () => const DefaultLoading(),
      error: (e, _) => DefaultError(e.toString()),
      data: (data) {
        return RefreshIndicator(
          onRefresh: () => context.refresh(charactersProvider),
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black87,
              );
            },
            itemBuilder: (context, index) {
              final character = data[index];
              return FadeIn(
                child: CharacterItem(
                  character: character,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CharacterItem extends StatelessWidget {
  final CharacterModel character;

  const CharacterItem({
    Key key,
    @required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(character.img),
      ),
      title: Text(character.nickname),
      subtitle: Text(character.name),
    );
  }
}
