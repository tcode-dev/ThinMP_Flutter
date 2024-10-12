// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playlistDetailHash() => r'0714b24b0120ee45dda0f64be1124456e18e59aa';

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

abstract class _$PlaylistDetail
    extends BuildlessAutoDisposeNotifier<PlaylistModel?> {
  late final String id;

  PlaylistModel? build(
    String id,
  );
}

/// See also [PlaylistDetail].
@ProviderFor(PlaylistDetail)
const playlistDetailProvider = PlaylistDetailFamily();

/// See also [PlaylistDetail].
class PlaylistDetailFamily extends Family<PlaylistModel?> {
  /// See also [PlaylistDetail].
  const PlaylistDetailFamily();

  /// See also [PlaylistDetail].
  PlaylistDetailProvider call(
    String id,
  ) {
    return PlaylistDetailProvider(
      id,
    );
  }

  @override
  PlaylistDetailProvider getProviderOverride(
    covariant PlaylistDetailProvider provider,
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
  String? get name => r'playlistDetailProvider';
}

/// See also [PlaylistDetail].
class PlaylistDetailProvider
    extends AutoDisposeNotifierProviderImpl<PlaylistDetail, PlaylistModel?> {
  /// See also [PlaylistDetail].
  PlaylistDetailProvider(
    String id,
  ) : this._internal(
          () => PlaylistDetail()..id = id,
          from: playlistDetailProvider,
          name: r'playlistDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playlistDetailHash,
          dependencies: PlaylistDetailFamily._dependencies,
          allTransitiveDependencies:
              PlaylistDetailFamily._allTransitiveDependencies,
          id: id,
        );

  PlaylistDetailProvider._internal(
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
  PlaylistModel? runNotifierBuild(
    covariant PlaylistDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(PlaylistDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlaylistDetailProvider._internal(
        () => create()..id = id,
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
  AutoDisposeNotifierProviderElement<PlaylistDetail, PlaylistModel?>
      createElement() {
    return _PlaylistDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlaylistDetailRef on AutoDisposeNotifierProviderRef<PlaylistModel?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlaylistDetailProviderElement
    extends AutoDisposeNotifierProviderElement<PlaylistDetail, PlaylistModel?>
    with PlaylistDetailRef {
  _PlaylistDetailProviderElement(super.provider);

  @override
  String get id => (origin as PlaylistDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
