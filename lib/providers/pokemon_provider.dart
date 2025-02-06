import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/models/pokemon.dart';
import 'package:pokezuka/network/dio_client.dart';
import 'package:pokezuka/providers/settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
Future<List<PokemonUrl>> pokemons(Ref ref) async {
  final dio = ref.watch(dioProvider);
  final response =
      await dio.get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
  return response.data['results']
      .map<PokemonUrl>((json) => PokemonUrl.fromJson(json))
      .toList();
}

@riverpod
Future<Pokemon> pokemon(Ref ref, String id) async {
  final dio = ref.watch(dioProvider);
  final pokemons = await ref.watch(pokemonsProvider.future);
  final pokemon = pokemons.firstWhere((pokemon) => pokemon.name == id);
  final response = await dio.get(pokemon.url);
  return Pokemon.fromJson(response.data);
}

@riverpod
Future<Species> species(Ref ref, String id) async {
  final dio = ref.watch(dioProvider);
  final pokemon = await ref.watch(pokemonProvider(id).future);
  final response = await dio.get(pokemon.species.url);
  return Species.fromJson(response.data);
}

@riverpod
Future<List<Name>> names(Ref ref, String id) async {
  return ref.watch(
    speciesProvider(id).future.select((value) async => (await value).names),
  );
}

@riverpod
Future<String> name(Ref ref, String id) async {
  final names = await ref.watch(namesProvider(id).future);
  final locale = ref.watch(localeProvider);
  try {
    return names.firstWhere((name) => name.language.name == locale).name;
  } catch (e) {
    return names.first.name;
  }
}
