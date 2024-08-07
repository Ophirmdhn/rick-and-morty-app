import 'dart:convert';
import 'package:rick_and_morty_app/features/rick_morty/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterRemoteDatasource {
  Future<List<CharacterModel>> getAllCharacter(int page);
}

class CharacterRemoteDatasourceImpl extends CharacterRemoteDatasource {
  @override
  Future<List<CharacterModel>> getAllCharacter(int page) async {
    Uri url = Uri.parse("https://rickandmortyapi.com/api/character?page=$page");
    var response = await http.get(url);

    Map<String, dynamic> dataBody = jsonDecode(response.body);
    List<dynamic> data = dataBody["results"]; // nama json list menampung object
    return CharacterModel.fromJsonList(data);
  }
}
