import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/features/rick_morty/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/providers/character_provider.dart';
import 'package:rick_and_morty_app/features/rick_morty/presentation/widgets/character_card.dart';

class CharacterPage extends ConsumerStatefulWidget {
  const CharacterPage({super.key});

  @override
  CharacterPageState createState() => CharacterPageState();
}

class CharacterPageState extends ConsumerState<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character"),
      ),
      body: FutureBuilder<List<Character>>(
        future: ref.watch(characterProvider.future),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final characters = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CharacterCard(
                  character: characters[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
