import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PostModel extends Equatable {
  const PostModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel copyWith({
    int userId,
    int id,
    String title,
    String body,
  }) =>
      PostModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostModel.fromJson(String str) =>
      PostModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"] as int,
        id: json["id"] as int,
        title: json["title"] as String,
        body: json["body"] as String,
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  @override
  List<Object> get props => [id];
}
