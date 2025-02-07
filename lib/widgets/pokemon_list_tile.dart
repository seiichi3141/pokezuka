import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/providers/pokemon_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          child: Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: PokemonImage(name: name),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonName(name: name),
                      Text(pokemon?.id.toString() ?? 'This is a subtitle'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PokemonImage extends ConsumerWidget {
  const PokemonImage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(spritesProvider(name).future),
      builder: (context, snapshot) {
        final sprites = snapshot.data;
        return Skeletonizer(
          enabled: snapshot.connectionState != ConnectionState.done ||
              sprites == null,
          child: sprites == null || sprites.frontDefault == null
              ? const SizedBox(
                  width: 96,
                  height: 96,
                )
              : CachedNetworkImage(
                  width: 96,
                  height: 96,
                  imageUrl: sprites.frontDefault!,
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
