import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../data/models/post_model.dart';
import '../../data/repositories/json_placeholder_repository.dart';
import '../../service_locator.dart';
import '../widgets/default_error.dart';
import '../widgets/default_loading.dart';

final posts = RM.injectFuture<List<PostModel>>(
  () => sl.get<JsonPlaceHolderRepository>().all(),
);

class PostsScreen extends StatelessWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context) {
    return On.all(
      onIdle: () => const DefaultLoading(),
      onWaiting: () => const DefaultLoading(),
      onError: (e, refresh) => DefaultError(e.toString()),
      onData: () => RefreshIndicator(
        onRefresh: () => posts.refresh(),
        child: ListView.separated(
          itemCount: posts.state.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black87,
            );
          },
          itemBuilder: (context, index) {
            final post = posts.state[index];
            return FadeIn(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          },
        ),
      ),
    ).listenTo(posts);
  }
}
