import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/core/error/failure.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/usecases/get_all_character.dart';

part 'rick_morty_event.dart';
part 'rick_morty_state.dart';

class RickMortyBloc extends Bloc<RickMortyEvent, RickMortyState> {
  final GetAllCharacter getAllCharacter; // usecase

  RickMortyBloc({
    required this.getAllCharacter,
  }) : super(CharacterStateEmpty()) {
    on<RickMortyEventGetAllCharacter>((event, emit) async {
      emit(CharacterStateLoading());

      Either<Failure, List<Character>> resultGetAllCharacter =
          await getAllCharacter.execute(event.page);

      resultGetAllCharacter.fold((leftResult) {
        // jika terdapat error
        if (leftResult is GeneralFailure) {
          emit(CharacterStateError(leftResult.message));
        } else {
          emit(CharacterStateError("Tidak bisa mengambil data character"));
        }
      }, (rightResult) {
        // jika berhasil
        emit(CharacterStateLoaded(rightResult));
      });
    });
  }
}
