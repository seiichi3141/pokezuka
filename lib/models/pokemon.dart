import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class PokemonUrl with _$PokemonUrl {
  const factory PokemonUrl({
    required String name,
    required String url,
  }) = _PokemonUrl;

  factory PokemonUrl.fromJson(Map<String, dynamic> json) =>
      _$PokemonUrlFromJson(json);
}

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    @JsonKey(name: 'base_experience') required int baseExperience,
    required int height,
    @JsonKey(name: 'is_default') required bool isDefault,
    required int order,
    required int weight,
    required PokemonUrl species,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
class Species with _$Species {
  const factory Species({
    required int id,
    required String name,
    required int order,
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'capture_rate') required int captureRate,
    @JsonKey(name: 'base_happiness') required int baseHappiness,
    @JsonKey(name: 'is_baby') required bool isBaby,
    @JsonKey(name: 'is_legendary') required bool isLegendary,
    @JsonKey(name: 'is_mythical') required bool isMythical,
    @JsonKey(name: 'hatch_counter') required int hatchCounter,
    @JsonKey(name: 'has_gender_differences') required bool hasGenderDifferences,
    @JsonKey(name: 'forms_switchable') required bool formsWwitchable,
    required List<Name> names,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    required String name,
    required PokemonUrl language,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
