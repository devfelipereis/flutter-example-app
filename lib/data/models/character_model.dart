import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  const CharacterModel({
    required this.id,
    required this.name,
    required this.img,
    required this.nickname,
  });

  final int id;
  final String name;
  final String img;
  final String nickname;

  factory CharacterModel.fromJson(String str) =>
      CharacterModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        id: json["char_id"] as int,
        name: json["name"] as String,
        img: json["img"] as String,
        nickname: json["nickname"] as String,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "img": img,
        "nickname": nickname,
      };

  @override
  List<Object> get props => [id];
}
