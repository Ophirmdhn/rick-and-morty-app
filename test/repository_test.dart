import 'dart:developer';

import 'package:rick_and_morty_app/features/rick_morty/data/datasources/character_remote_datasource.dart';

void main() async {
  final CharacterRemoteDatasourceImpl characterRemoteDatasourceImpl =
      CharacterRemoteDatasourceImpl();

  var response = await characterRemoteDatasourceImpl.getAllCharacter(1);

  for (var dataUser in response) {
    log("Tes Datasource ${dataUser.toJson()}");
  }
}
