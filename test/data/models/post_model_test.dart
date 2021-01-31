import 'package:example_app/data/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final postMap = {
    'id': 1,
    'userId': 1,
    'title': 'Test title',
    'body': 'text',
  };
  test('Post model from map should match postMap values', () {
    final post = PostModel.fromMap(postMap);

    expect(post.id, postMap['id']);
    expect(post.userId, postMap['userId']);
    expect(post.title, postMap['title']);
    expect(post.body, postMap['body']);
  });

  test('Post model from map to json string', () {
    final post = PostModel.fromMap(postMap);

    expect(post.toJson(), isInstanceOf<String>());
  });
}
