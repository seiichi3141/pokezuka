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
      height: 220,
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
                  vertical: 8,
                  horizontal: 12,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Center(
                        child: SizedBox(
                          width: 180,
                          height: 180,
                          child: PokemonImage(name: name),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
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
          child: Stack(
            children: [
              Text(
                index?.toString().padLeft(3, '0') ?? 'Index',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
                  height: 1.2,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 8
                    ..strokeCap = StrokeCap.round
                    ..strokeJoin = StrokeJoin.round
                    ..color = Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withValues(alpha: 0.8),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Text(
                index?.toString().padLeft(3, '0') ?? 'Index',
                style: TextStyle(
                  fontSize: 52,
                  fontFamily: GoogleFonts.alfaSlabOne().fontFamily,
                  color: Colors.grey[400],
                  height: 1.2,
                ),
              ),
            ],
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
                  filterQuality: FilterQuality.none,
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
          child: Stack(
            children: [
              Text(
                name ?? 'Name',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: local != 'ko'
                      ? GoogleFonts.delaGothicOne().fontFamily
                      : GoogleFonts.blackHanSans().fontFamily,
                  height: 1.1,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 8
                    ..strokeCap = StrokeCap.round
                    ..strokeJoin = StrokeJoin.round
                    ..color = Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withValues(alpha: 0.8),
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Text(
                name ?? 'Name',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: local != 'ko'
                      ? GoogleFonts.delaGothicOne().fontFamily
                      : GoogleFonts.blackHanSans().fontFamily,
                  height: 1.1,
                ),
              ),
            ],
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
          child: Stack(
            children: [
              Text(
                genus ?? 'Genus',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: local != 'ko'
                      ? GoogleFonts.delaGothicOne().fontFamily
                      : GoogleFonts.blackHanSans().fontFamily,
                  height: 1.1,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..strokeCap = StrokeCap.round
                    ..strokeJoin = StrokeJoin.round
                    ..color = Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withValues(alpha: 0.8),
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Text(
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
            ],
          ),
        );
      },
    );
  }
}
