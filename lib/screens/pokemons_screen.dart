import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/extensions/context.dart';
import 'package:pokezuka/providers/pokemon_provider.dart';
import 'package:pokezuka/widgets/locale_select.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonsScreen extends ConsumerWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homeTitle),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(context.l10n.settings),
                      content: LocaleSelect(),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(context.l10n.close),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.settings)),
        ],
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
              return PokemonListTile(
                name: pokemon.name,
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
    return FutureBuilder(
      future: ref.watch(pokemonProvider(name).future),
      builder: (context, snapshot) {
        final pokemon = snapshot.data;
        return Skeletonizer(
          enabled: snapshot.connectionState != ConnectionState.done ||
              pokemon == null,
          child: ListTile(
            title: PokemonName(name: name),
            subtitle: Text(pokemon?.id.toString() ?? 'This is a subtitle'),
          ),
        );
      },
    );
  }
}

class PokemonName extends ConsumerWidget {
  const PokemonName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(nameProvider(name).future),
      builder: (context, snapshot) {
        final name = snapshot.data;
        return Skeletonizer(
          enabled:
              snapshot.connectionState != ConnectionState.done || name == null,
          child: Text(name ?? 'This is a name'),
        );
      },
    );
  }
}
