// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonUrlImpl _$$PokemonUrlImplFromJson(Map<String, dynamic> json) =>
    _$PokemonUrlImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$PokemonUrlImplToJson(_$PokemonUrlImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      isDefault: json['is_default'] as bool,
      order: (json['order'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      species: PokemonUrl.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'sprites': instance.sprites,
      'species': instance.species,
    };

_$SpritesImpl _$$SpritesImplFromJson(Map<String, dynamic> json) =>
    _$SpritesImpl(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
    );

Map<String, dynamic> _$$SpritesImplToJson(_$SpritesImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
    };

_$SpeciesImpl _$$SpeciesImplFromJson(Map<String, dynamic> json) =>
    _$SpeciesImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
      genderRate: (json['gender_rate'] as num).toInt(),
      captureRate: (json['capture_rate'] as num).toInt(),
      baseHappiness: (json['base_happiness'] as num).toInt(),
      isBaby: json['is_baby'] as bool,
      isLegendary: json['is_legendary'] as bool,
      isMythical: json['is_mythical'] as bool,
      hatchCounter: (json['hatch_counter'] as num).toInt(),
      hasGenderDifferences: json['has_gender_differences'] as bool,
      formsWwitchable: json['forms_switchable'] as bool,
      names: (json['names'] as List<dynamic>)
          .map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => Genus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpeciesImplToJson(_$SpeciesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'gender_rate': instance.genderRate,
      'capture_rate': instance.captureRate,
      'base_happiness': instance.baseHappiness,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
      'hatch_counter': instance.hatchCounter,
      'has_gender_differences': instance.hasGenderDifferences,
      'forms_switchable': instance.formsWwitchable,
      'names': instance.names,
      'genera': instance.genera,
    };

_$NameImpl _$$NameImplFromJson(Map<String, dynamic> json) => _$NameImpl(
      name: json['name'] as String,
      language: PokemonUrl.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NameImplToJson(_$NameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };

_$GenusImpl _$$GenusImplFromJson(Map<String, dynamic> json) => _$GenusImpl(
      genus: json['genus'] as String,
      language: PokemonUrl.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenusImplToJson(_$GenusImpl instance) =>
    <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language,
    };
