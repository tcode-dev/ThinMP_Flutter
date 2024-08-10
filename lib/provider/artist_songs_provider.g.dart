// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistSongsHash() => r'18830d1d372870043270f1628104ccf399fa0b03';

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

/// See also [artistSongs].
@ProviderFor(artistSongs)
const artistSongsProvider = ArtistSongsFamily();

/// See also [artistSongs].
class ArtistSongsFamily extends Family<AsyncValue<List<Song?>>> {
  /// See also [artistSongs].
  const ArtistSongsFamily();

  /// See also [artistSongs].
  ArtistSongsProvider call(
    String id,
  ) {
    return ArtistSongsProvider(
      id,
    );
  }

  @override
  ArtistSongsProvider getProviderOverride(
    covariant ArtistSongsProvider provider,
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
  String? get name => r'artistSongsProvider';
}

/// See also [artistSongs].
class ArtistSongsProvider extends AutoDisposeFutureProvider<List<Song?>> {
  /// See also [artistSongs].
  ArtistSongsProvider(
    String id,
  ) : this._internal(
          (ref) => artistSongs(
            ref as ArtistSongsRef,
            id,
          ),
          from: artistSongsProvider,
          name: r'artistSongsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artistSongsHash,
          dependencies: ArtistSongsFamily._dependencies,
          allTransitiveDependencies:
              ArtistSongsFamily._allTransitiveDependencies,
          id: id,
        );

  ArtistSongsProvider._internal(
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
    FutureOr<List<Song?>> Function(ArtistSongsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistSongsProvider._internal(
        (ref) => create(ref as ArtistSongsRef),
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
  AutoDisposeFutureProviderElement<List<Song?>> createElement() {
    return _ArtistSongsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistSongsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArtistSongsRef on AutoDisposeFutureProviderRef<List<Song?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ArtistSongsProviderElement
    extends AutoDisposeFutureProviderElement<List<Song?>> with ArtistSongsRef {
  _ArtistSongsProviderElement(super.provider);

  @override
  String get id => (origin as ArtistSongsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
