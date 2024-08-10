// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumHash() => r'162941579d17876aaaa152e029aa4daee60923c9';

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

/// See also [album].
@ProviderFor(album)
const albumProvider = AlbumFamily();

/// See also [album].
class AlbumFamily extends Family<AsyncValue<Album?>> {
  /// See also [album].
  const AlbumFamily();

  /// See also [album].
  AlbumProvider call(
    String id,
  ) {
    return AlbumProvider(
      id,
    );
  }

  @override
  AlbumProvider getProviderOverride(
    covariant AlbumProvider provider,
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
  String? get name => r'albumProvider';
}

/// See also [album].
class AlbumProvider extends AutoDisposeFutureProvider<Album?> {
  /// See also [album].
  AlbumProvider(
    String id,
  ) : this._internal(
          (ref) => album(
            ref as AlbumRef,
            id,
          ),
          from: albumProvider,
          name: r'albumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumHash,
          dependencies: AlbumFamily._dependencies,
          allTransitiveDependencies: AlbumFamily._allTransitiveDependencies,
          id: id,
        );

  AlbumProvider._internal(
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
    FutureOr<Album?> Function(AlbumRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlbumProvider._internal(
        (ref) => create(ref as AlbumRef),
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
  AutoDisposeFutureProviderElement<Album?> createElement() {
    return _AlbumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumRef on AutoDisposeFutureProviderRef<Album?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AlbumProviderElement extends AutoDisposeFutureProviderElement<Album?>
    with AlbumRef {
  _AlbumProviderElement(super.provider);

  @override
  String get id => (origin as AlbumProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
