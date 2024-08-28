// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumDetailHash() => r'0b0ad507743192a8e4ce9c11e7215d2527866f51';

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

abstract class _$AlbumDetail
    extends BuildlessAutoDisposeAsyncNotifier<AlbumDetailViewModel> {
  late final String id;

  FutureOr<AlbumDetailViewModel> build(
    String id,
  );
}

/// See also [AlbumDetail].
@ProviderFor(AlbumDetail)
const albumDetailProvider = AlbumDetailFamily();

/// See also [AlbumDetail].
class AlbumDetailFamily extends Family<AsyncValue<AlbumDetailViewModel>> {
  /// See also [AlbumDetail].
  const AlbumDetailFamily();

  /// See also [AlbumDetail].
  AlbumDetailProvider call(
    String id,
  ) {
    return AlbumDetailProvider(
      id,
    );
  }

  @override
  AlbumDetailProvider getProviderOverride(
    covariant AlbumDetailProvider provider,
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
  String? get name => r'albumDetailProvider';
}

/// See also [AlbumDetail].
class AlbumDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AlbumDetail, AlbumDetailViewModel> {
  /// See also [AlbumDetail].
  AlbumDetailProvider(
    String id,
  ) : this._internal(
          () => AlbumDetail()..id = id,
          from: albumDetailProvider,
          name: r'albumDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$albumDetailHash,
          dependencies: AlbumDetailFamily._dependencies,
          allTransitiveDependencies:
              AlbumDetailFamily._allTransitiveDependencies,
          id: id,
        );

  AlbumDetailProvider._internal(
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
  FutureOr<AlbumDetailViewModel> runNotifierBuild(
    covariant AlbumDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AlbumDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: AlbumDetailProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AlbumDetail, AlbumDetailViewModel>
      createElement() {
    return _AlbumDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AlbumDetailRef
    on AutoDisposeAsyncNotifierProviderRef<AlbumDetailViewModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AlbumDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AlbumDetail,
        AlbumDetailViewModel> with AlbumDetailRef {
  _AlbumDetailProviderElement(super.provider);

  @override
  String get id => (origin as AlbumDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
