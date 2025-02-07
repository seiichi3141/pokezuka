import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/extensions/context.dart';
import 'package:pokezuka/providers/pokemon_provider.dart';
import 'package:pokezuka/widgets/locale_select.dart';
import 'package:pokezuka/widgets/pokemon_list_tile.dart';

class PokemonsScreen extends ConsumerWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
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
            padding: const EdgeInsets.symmetric(vertical: 8),
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
