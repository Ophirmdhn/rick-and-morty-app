part of 'rick_morty_bloc.dart';

abstract class RickMortyEvent extends Equatable {}

class RickMortyEventGetAllCharacter extends RickMortyEvent {
  final int page;

  RickMortyEventGetAllCharacter(this.page);

  @override
  List<Object?> get props => [page];
}
