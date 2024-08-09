import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String imageUrl,
  }) = _Character;

  factory Character.fromJSON(Map<String, dynamic> json) =>
      Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        imageUrl: json["image"],
      );

  // Parsing data dari List<Map> ke List<CharacterModel>
  static List<Character> fromJsonList(List<dynamic> data) {
    if (data.isEmpty) return [];

    return data
        .map((json) => Character.fromJSON(json as Map<String, dynamic>))
        .toList();
  }
}
