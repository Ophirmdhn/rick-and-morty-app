part of 'rick_morty_bloc.dart';

abstract class RickMortyState extends Equatable {}

class CharacterStateEmpty extends RickMortyState {
  @override
  List<Object?> get props => [];
}

class CharacterStateLoading extends RickMortyState {
  @override
  List<Object?> get props => [];
}

class CharacterStateError extends RickMortyState {
  final String message;

  CharacterStateError(this.message);

  @override
  List<Object?> get props => [message];
}

class CharacterStateLoaded extends RickMortyState {
  final List<Character> allCharacter;

  CharacterStateLoaded(this.allCharacter);

  @override
  List<Object?> get props => [allCharacter];
}
