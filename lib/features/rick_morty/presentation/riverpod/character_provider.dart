import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/usecases/get_all_character.dart';

final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) {
    return CharacterRepositoryImpl(
      characterRemoteDatasource: CharacterRemoteDatasourceImpl(),
    );
  },
);

final getAllCharacterProvider = Provider<GetAllCharacter>(
  (ref) {
    final characterRepository = ref.watch(characterRepositoryProvider);
    return GetAllCharacter(characterRepository: characterRepository);
  },
);

final characterProvider = FutureProvider<List<Character>>(
  (ref) async {
    final getAllCharacter = ref.watch(getAllCharacterProvider);
    final result = await getAllCharacter.execute(3);
    return result.fold(
      (leftResult) {
        throw Exception(leftResult);
      },
      (rightResult) => rightResult,
    );
  },
);
