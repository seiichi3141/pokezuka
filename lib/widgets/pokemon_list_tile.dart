import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokezuka/providers/pokemon_provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  const PokemonListTile({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 140,
      child: FutureBuilder(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 60,
                      top: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: 350,
                        child: PokemonImage(name: name),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 0,
                      child: PokemonIndex(name: name),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PokemonGenus(name: name),
                          PokemonName(name: name),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PokemonIndex extends ConsumerWidget {
  const PokemonIndex({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(indexProvider(name).future),
      builder: (context, snapshot) {
        final index = snapshot.data;
        return Skeletonizer(
          enabled:
              snapshot.connectionState != ConnectionState.done || index == null,
          child: Text(
            index?.toString() ?? 'Index',
            style: TextStyle(
              fontSize: 70,
              // fontFamily: GoogleFonts.merriweather().fontFamily,
              fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
              color: Colors.grey[400],
              height: 1.2,
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
              ? const SizedBox()
              : CachedNetworkImage(
                  imageUrl: sprites.frontDefault!,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment(0.5, -0.1),
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
    final local = ref.watch(pokemonLocaleProvider);
    return FutureBuilder(
      future: ref.watch(nameProvider(name).future),
      builder: (context, snapshot) {
        final name = snapshot.data;
        return Skeletonizer(
          enabled:
              snapshot.connectionState != ConnectionState.done || name == null,
          child: Text(
            name ?? 'Name',
            style: TextStyle(
              fontSize: 48,
              fontFamily: local != 'ko'
                  ? GoogleFonts.delaGothicOne().fontFamily
                  : GoogleFonts.blackHanSans().fontFamily,
              height: 1.1,
            ),
          ),
        );
      },
    );
  }
}

class PokemonGenus extends ConsumerWidget {
  const PokemonGenus({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(pokemonLocaleProvider);
    return FutureBuilder(
      future: ref.watch(genusProvider(name).future),
      builder: (context, snapshot) {
        final genus = snapshot.data;
        return Skeletonizer(
          enabled: snapshot.connectionState != ConnectionState.done,
          child: Text(
            genus ?? 'Genus',
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey[600],
              fontFamily: local != 'ko'
                  ? GoogleFonts.delaGothicOne().fontFamily
                  : GoogleFonts.blackHanSans().fontFamily,
              height: 1.1,
            ),
          ),
        );
      },
    );
  }
}
