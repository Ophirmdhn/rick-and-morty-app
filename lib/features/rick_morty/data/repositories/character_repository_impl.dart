import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/error/failure.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterRemoteDatasource characterRemoteDatasource;

  CharacterRepositoryImpl({required this.characterRemoteDatasource});

  @override
  Future<Either<Failure, List<Character>>> getAllCharacter(int page) async {
    try {
      List<CharacterModel> result =
          await characterRemoteDatasource.getAllCharacter(page);
      return Right(result);
    } catch (e) {
      return const Left(
          GeneralFailure(message: "Tidak dapat mengambil data Character!"));
    }
  }
}
