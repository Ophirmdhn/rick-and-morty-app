import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/error/failure.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/repositories/character_repository.dart';

class GetAllCharacter {
  final CharacterRepository characterRepository;

  GetAllCharacter({required this.characterRepository});

  Future<Either<Failure, List<Character>>> execute(int page) async {
    return await characterRepository.getAllCharacter(page);
  }
}