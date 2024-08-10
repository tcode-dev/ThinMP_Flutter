// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_albums_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistAlbumsHash() => r'ef5e82aa88b8acddfb3a82f905aa64b852f076da';

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

/// See also [artistAlbums].
@ProviderFor(artistAlbums)
const artistAlbumsProvider = ArtistAlbumsFamily();

/// See also [artistAlbums].
class ArtistAlbumsFamily extends Family<AsyncValue<List<Album?>>> {
  /// See also [artistAlbums].
  const ArtistAlbumsFamily();

  /// See also [artistAlbums].
  ArtistAlbumsProvider call(
    String id,
  ) {
    return ArtistAlbumsProvider(
      id,
    );
  }

  @override
  ArtistAlbumsProvider getProviderOverride(
    covariant ArtistAlbumsProvider provider,
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
  String? get name => r'artistAlbumsProvider';
}

/// See also [artistAlbums].
class ArtistAlbumsProvider extends AutoDisposeFutureProvider<List<Album?>> {
  /// See also [artistAlbums].
  ArtistAlbumsProvider(
    String id,
  ) : this._internal(
          (ref) => artistAlbums(
            ref as ArtistAlbumsRef,
            id,
          ),
          from: artistAlbumsProvider,
          name: r'artistAlbumsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artistAlbumsHash,
          dependencies: ArtistAlbumsFamily._dependencies,
          allTransitiveDependencies:
              ArtistAlbumsFamily._allTransitiveDependencies,
          id: id,
        );

  ArtistAlbumsProvider._internal(
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
    FutureOr<List<Album?>> Function(ArtistAlbumsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistAlbumsProvider._internal(
        (ref) => create(ref as ArtistAlbumsRef),
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
  AutoDisposeFutureProviderElement<List<Album?>> createElement() {
    return _ArtistAlbumsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistAlbumsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArtistAlbumsRef on AutoDisposeFutureProviderRef<List<Album?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ArtistAlbumsProviderElement
    extends AutoDisposeFutureProviderElement<List<Album?>>
    with ArtistAlbumsRef {
  _ArtistAlbumsProviderElement(super.provider);

  @override
  String get id => (origin as ArtistAlbumsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
