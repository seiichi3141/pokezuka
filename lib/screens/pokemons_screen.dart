import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/providers/pokemon_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonsScreen extends ConsumerWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ポケモン図鑑'),
      ),
      body: FutureBuilder(
        future: ref.watch(pokemonsProvider.future),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final pokemons = snapshot.data;
          if (snapshot.hasError || pokemons == null) {
            return Center(
              child: Text('エラーが発生しました'),
            );
          }

          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return ListTile(
                title: Text(pokemon.name),
                subtitle: Text(pokemon.url),
              );
            },
          );
        },
      ),
    );
  }
}

class PokemonListTile extends ConsumerWidget {
  const PokemonListTile({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonProvider(name));
    return Skeletonizer(
      enabled: pokemon == null,
      child: ListTile(
        title: Text(pokemon!.name),
        subtitle: Text(pokemon.url),
      ),
    );
  }
}
