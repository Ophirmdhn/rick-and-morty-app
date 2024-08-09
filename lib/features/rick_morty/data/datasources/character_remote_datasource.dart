import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/core/constant/endpoint.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';

abstract class CharacterRemoteDatasource {
  Future<List<Character>> getAllCharacter(int page);
}

class CharacterRemoteDatasourceImpl extends CharacterRemoteDatasource {
  @override
  Future<List<Character>> getAllCharacter(int page) async {
    Uri url = Uri.parse(Endpoint.getAllUser(page));
    var response = await http.get(url);

    Map<String, dynamic> dataBody = jsonDecode(response.body);
    List<dynamic> data = dataBody["results"]; // nama json list menampung object
    return Character.fromJsonList(data);
  }
}
