import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../data/models/character_model.dart';
import '../../data/repositories/character_repository.dart';
import '../../service_locator.dart';
import '../widgets/default_error.dart';
import '../widgets/default_loading.dart';

final characters = RM.injectFuture<List<CharacterModel>>(
  () => sl.get<CharacterRepository>().all(),
);

class CharactersScreen extends StatelessWidget {
  const CharactersScreen();

  @override
  Widget build(BuildContext context) {
    return On.all(
      onIdle: () => const DefaultLoading(),
      onWaiting: () => const DefaultLoading(),
      onError: (e, refresh) => DefaultError(e.toString()),
      onData: () => RefreshIndicator(
        onRefresh: () => characters.refresh(),
        child: ListView.separated(
          itemCount: characters.state.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black87,
            );
          },
          itemBuilder: (context, index) {
            final character = characters.state[index];
            return FadeIn(
              child: CharacterItem(
                character: character,
              ),
            );
          },
        ),
      ),
    ).listenTo(characters);
  }
}

class CharacterItem extends StatelessWidget {
  final CharacterModel character;

  const CharacterItem({
    Key? key,
    required this.character,
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
