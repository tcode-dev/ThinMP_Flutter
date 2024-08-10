// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_songs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumSongsHash() => r'3a2303ed5e73d015ce5b1ed0264dfc9abd973f7f';

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

/// See also [albumSongs].
@ProviderFor(albumSongs)
const albumSongsProvider = AlbumSongsFamily();

/// See also [albumSongs].
class AlbumSongsFamily extends Family<AsyncValue<List<Song?>>> {
  /// See also [albumSongs].
  const AlbumSongsFamily();

  /// See also [albumSongs].
  AlbumSongsProvider call(
    String id,
  ) {
    return AlbumSongsProvider(
      id,
    );
  }

  @override
  AlbumSongsProvider getProviderOverride(
    covariant AlbumSongsProvider provider,
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
  String? get name => r'albumSongsProvider';
}

/// See also [albumSongs].
class AlbumSongsProvider extends AutoDisposeFutureProvider<List<Song?>> {
  /// See also [albumSongs].
  AlbumSongsProvider(
    String id,
  ) : this._internal(
          (ref) => albumSongs(
            ref as AlbumSongsRef,
            id,
          ),
          from: albumSongsProvider,
          name: r'albumSongsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumSongsHash,
          dependencies: AlbumSongsFamily._dependencies,
          allTransitiveDependencies:
              AlbumSongsFamily._allTransitiveDependencies,
          id: id,
        );

  AlbumSongsProvider._internal(
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
    FutureOr<List<Song?>> Function(AlbumSongsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlbumSongsProvider._internal(
        (ref) => create(ref as AlbumSongsRef),
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
    return _AlbumSongsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumSongsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumSongsRef on AutoDisposeFutureProviderRef<List<Song?>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AlbumSongsProviderElement
    extends AutoDisposeFutureProviderElement<List<Song?>> with AlbumSongsRef {
  _AlbumSongsProviderElement(super.provider);

  @override
  String get id => (origin as AlbumSongsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
