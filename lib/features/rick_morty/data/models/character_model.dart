import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.imageUrl,
  });

  // Json Map to CharacterModel
  factory CharacterModel.fromJson(Map<String, dynamic> data) {
    return CharacterModel(
      id: data["id"],
      name: data["name"],
      status: data["status"],
      imageUrl: data["image"],
    );
  }

  // CharacterModel to Json Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "status": status,
      "image": imageUrl,
    };
  }

  // List<Map> to List<CharacterModel>
  static List<CharacterModel> fromJsonList(List data) {
    if (data.isEmpty) return [];

    return data.map((data) => CharacterModel.fromJson(data)).toList();
  }
}
