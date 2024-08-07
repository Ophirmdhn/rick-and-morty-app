import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/datasources/character_remote_datasource.dart';
import 'package:rick_and_morty_app/features/rick_morty/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/usecases/get_all_character.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/bloc/rick_morty_bloc.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/pages/character_page.dart';
import 'package:rick_and_morty_app/observer.dart';

void main() {
  Bloc.observer = MyObserver();
  final characterRepositoryImpl = CharacterRepositoryImpl(
      characterRemoteDatasource: CharacterRemoteDatasourceImpl());
  runApp(MyApp(characterRepositoryImpl: characterRepositoryImpl));
}

class MyApp extends StatelessWidget {
  final CharacterRepositoryImpl characterRepositoryImpl;

  const MyApp({
    super.key,
    required this.characterRepositoryImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => RickMortyBloc(
            getAllCharacter: GetAllCharacter(characterRepository: characterRepositoryImpl),
          ),
        )
      ],
      child: MaterialApp(
        title: "Rick & Morty",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const CharacterPage(),
      ),
    );
  }
}
