import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/bloc/rick_morty_bloc.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/widgets/character_card.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    context.read<RickMortyBloc>().add(RickMortyEventGetAllCharacter(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character"),
      ),
      body: BlocBuilder<RickMortyBloc, RickMortyState>(
        builder: (context, state) {
          if (state is CharacterStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CharacterStateError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is CharacterStateLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom dalam grid
                crossAxisSpacing: 8, // Jarak horizontal antara item
                mainAxisSpacing: 8, // Jarak vertikal antara item
                childAspectRatio: 3 / 4, // Rasio aspek item (lebar/tinggi)
              ),
              itemCount: state.allCharacter.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CharacterCard(
                    character: Character(
                      id: state.allCharacter[index].id,
                      name: state.allCharacter[index].name,
                      status: state.allCharacter[index].status,
                      imageUrl: state.allCharacter[index].imageUrl,
                    ),
                  ),
                );
              },
            );

            // return ListView.builder(
            //   padding: const EdgeInsets.all(16),
            //   itemCount: state.allCharacter.length,
            //   itemBuilder: (context, builder) {
            //     return Padding(
            //       padding: const EdgeInsets.only(bottom: 8),
            //       child: CharacterCard(
            //         character: Character(
            //           id: state.allCharacter[builder].id,
            //           name: state.allCharacter[builder].name,
            //           status: state.allCharacter[builder].status,
            //           imageUrl: state.allCharacter[builder].imageUrl,
            //         ),
            //       ),
            //     );
            //   },
            // );
          }

          return const Center(
            child: Text("Tidak ada Data!"),
          );
        },
      ),
    );
  }
}
