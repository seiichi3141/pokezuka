// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonsHash() => r'81ff9950e9cf731cf253833bceea774a688c3858';

/// See also [pokemons].
@ProviderFor(pokemons)
final pokemonsProvider = AutoDisposeFutureProvider<List<PokemonUrl>>.internal(
  pokemons,
  name: r'pokemonsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pokemonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PokemonsRef = AutoDisposeFutureProviderRef<List<PokemonUrl>>;
String _$pokemonHash() => r'b905ed478cc973e0f22271834e13f3671397d0db';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pokemon].
@ProviderFor(pokemon)
const pokemonProvider = PokemonFamily();

/// See also [pokemon].
class PokemonFamily extends Family<AsyncValue<Pokemon>> {
  /// See also [pokemon].
  const PokemonFamily();

  /// See also [pokemon].
  PokemonProvider call(
    String id,
  ) {
    return PokemonProvider(
      id,
    );
  }

  @override
  PokemonProvider getProviderOverride(
    covariant PokemonProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pokemonProvider';
}

/// See also [pokemon].
class PokemonProvider extends AutoDisposeFutureProvider<Pokemon> {
  /// See also [pokemon].
  PokemonProvider(
    String id,
  ) : this._internal(
          (ref) => pokemon(
            ref as PokemonRef,
            id,
          ),
          from: pokemonProvider,
          name: r'pokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pokemonHash,
          dependencies: PokemonFamily._dependencies,
          allTransitiveDependencies: PokemonFamily._allTransitiveDependencies,
          id: id,
        );

  PokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Pokemon> Function(PokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PokemonProvider._internal(
        (ref) => create(ref as PokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Pokemon> createElement() {
    return _PokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PokemonProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PokemonRef on AutoDisposeFutureProviderRef<Pokemon> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PokemonProviderElement extends AutoDisposeFutureProviderElement<Pokemon>
    with PokemonRef {
  _PokemonProviderElement(super.provider);

  @override
  String get id => (origin as PokemonProvider).id;
}

String _$speciesHash() => r'55b5e2df99c3a50d564a5f1cbd85ede3bbebe01d';

/// See also [species].
@ProviderFor(species)
const speciesProvider = SpeciesFamily();

/// See also [species].
class SpeciesFamily extends Family<AsyncValue<Species>> {
  /// See also [species].
  const SpeciesFamily();

  /// See also [species].
  SpeciesProvider call(
    String id,
  ) {
    return SpeciesProvider(
      id,
    );
  }

  @override
  SpeciesProvider getProviderOverride(
    covariant SpeciesProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'speciesProvider';
}

/// See also [species].
class SpeciesProvider extends AutoDisposeFutureProvider<Species> {
  /// See also [species].
  SpeciesProvider(
    String id,
  ) : this._internal(
          (ref) => species(
            ref as SpeciesRef,
            id,
          ),
          from: speciesProvider,
          name: r'speciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$speciesHash,
          dependencies: SpeciesFamily._dependencies,
          allTransitiveDependencies: SpeciesFamily._allTransitiveDependencies,
          id: id,
        );

  SpeciesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Species> Function(SpeciesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpeciesProvider._internal(
        (ref) => create(ref as SpeciesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Species> createElement() {
    return _SpeciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpeciesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SpeciesRef on AutoDisposeFutureProviderRef<Species> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SpeciesProviderElement extends AutoDisposeFutureProviderElement<Species>
    with SpeciesRef {
  _SpeciesProviderElement(super.provider);

  @override
  String get id => (origin as SpeciesProvider).id;
}

String _$namesHash() => r'a5a204390bc5cbc8246eaac18152a15cc3c51dc1';

/// See also [names].
@ProviderFor(names)
const namesProvider = NamesFamily();

/// See also [names].
class NamesFamily extends Family<AsyncValue<List<Name>>> {
  /// See also [names].
  const NamesFamily();

  /// See also [names].
  NamesProvider call(
    String id,
  ) {
    return NamesProvider(
      id,
    );
  }

  @override
  NamesProvider getProviderOverride(
    covariant NamesProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'namesProvider';
}

/// See also [names].
class NamesProvider extends AutoDisposeFutureProvider<List<Name>> {
  /// See also [names].
  NamesProvider(
    String id,
  ) : this._internal(
          (ref) => names(
            ref as NamesRef,
            id,
          ),
          from: namesProvider,
          name: r'namesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$namesHash,
          dependencies: NamesFamily._dependencies,
          allTransitiveDependencies: NamesFamily._allTransitiveDependencies,
          id: id,
        );

  NamesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<Name>> Function(NamesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NamesProvider._internal(
        (ref) => create(ref as NamesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Name>> createElement() {
    return _NamesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NamesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NamesRef on AutoDisposeFutureProviderRef<List<Name>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NamesProviderElement extends AutoDisposeFutureProviderElement<List<Name>>
    with NamesRef {
  _NamesProviderElement(super.provider);

  @override
  String get id => (origin as NamesProvider).id;
}

String _$nameHash() => r'e21911d112cd4a4aa73b9e74ee16b88249306b1b';

/// See also [name].
@ProviderFor(name)
const nameProvider = NameFamily();

/// See also [name].
class NameFamily extends Family<AsyncValue<String>> {
  /// See also [name].
  const NameFamily();

  /// See also [name].
  NameProvider call(
    String id,
  ) {
    return NameProvider(
      id,
    );
  }

  @override
  NameProvider getProviderOverride(
    covariant NameProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'nameProvider';
}

/// See also [name].
class NameProvider extends AutoDisposeFutureProvider<String> {
  /// See also [name].
  NameProvider(
    String id,
  ) : this._internal(
          (ref) => name(
            ref as NameRef,
            id,
          ),
          from: nameProvider,
          name: r'nameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
          dependencies: NameFamily._dependencies,
          allTransitiveDependencies: NameFamily._allTransitiveDependencies,
          id: id,
        );

  NameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<String> Function(NameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NameProvider._internal(
        (ref) => create(ref as NameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _NameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NameProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NameRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NameProviderElement extends AutoDisposeFutureProviderElement<String>
    with NameRef {
  _NameProviderElement(super.provider);

  @override
  String get id => (origin as NameProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
