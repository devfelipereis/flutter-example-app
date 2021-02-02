import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import '../../data/models/post_model.dart';
import '../../providers/providers.dart';
import '../widgets/default_error.dart';
import '../widgets/default_loading.dart';

final postsProvider = FutureProvider<List<PostModel>>(
  (ref) => ref.watch(jsonPlaceHolderRepository).all(),
);

class PostsScreen extends ConsumerWidget {
  const PostsScreen();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final posts = watch(postsProvider);

    return posts.when(
      loading: () => const DefaultLoading(),
      error: (e, _) => DefaultError(e.toString()),
      data: (data) {
        return RefreshIndicator(
          onRefresh: () => context.refresh(postsProvider),
          child: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black87,
              );
            },
            itemBuilder: (context, index) {
              final post = data[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          ),
        );
      },
    );
  }
}
