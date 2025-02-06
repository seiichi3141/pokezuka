import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokezuka/models/pokemon.dart';
import 'package:pokezuka/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
Future<List<Pokemon>> pokemons(Ref ref) async {
  final dio = ref.watch(dioProvider);
  final response =
      await dio.get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');
  return response.data['results']
      .map<Pokemon>((json) => Pokemon.fromJson(json))
      .toList();
}

@riverpod
Pokemon? pokemon(Ref ref, String id) {
  final asyncPokemons = ref.watch(pokemonsProvider);
  if (!asyncPokemons.hasValue || asyncPokemons.value == null) {
    return null;
  }
  final pokemons = asyncPokemons.value!;
  return pokemons.firstWhere((pokemon) => pokemon.name == id);
}
