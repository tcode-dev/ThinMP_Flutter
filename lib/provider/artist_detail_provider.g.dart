// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistDetailHash() => r'fa5c5e8f72c5778a128be5f109c4235fef39b00b';

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

abstract class _$ArtistDetail
    extends BuildlessAutoDisposeAsyncNotifier<ArtistDetailViewModel?> {
  late final String id;

  FutureOr<ArtistDetailViewModel?> build(
    String id,
  );
}

/// See also [ArtistDetail].
@ProviderFor(ArtistDetail)
const artistDetailProvider = ArtistDetailFamily();

/// See also [ArtistDetail].
class ArtistDetailFamily extends Family<AsyncValue<ArtistDetailViewModel?>> {
  /// See also [ArtistDetail].
  const ArtistDetailFamily();

  /// See also [ArtistDetail].
  ArtistDetailProvider call(
    String id,
  ) {
    return ArtistDetailProvider(
      id,
    );
  }

  @override
  ArtistDetailProvider getProviderOverride(
    covariant ArtistDetailProvider provider,
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
  String? get name => r'artistDetailProvider';
}

/// See also [ArtistDetail].
class ArtistDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArtistDetail, ArtistDetailViewModel?> {
  /// See also [ArtistDetail].
  ArtistDetailProvider(
    String id,
  ) : this._internal(
          () => ArtistDetail()..id = id,
          from: artistDetailProvider,
          name: r'artistDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artistDetailHash,
          dependencies: ArtistDetailFamily._dependencies,
          allTransitiveDependencies:
              ArtistDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ArtistDetailProvider._internal(
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
  FutureOr<ArtistDetailViewModel?> runNotifierBuild(
    covariant ArtistDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ArtistDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtistDetailProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArtistDetail, ArtistDetailViewModel?>
      createElement() {
    return _ArtistDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArtistDetailRef
    on AutoDisposeAsyncNotifierProviderRef<ArtistDetailViewModel?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ArtistDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArtistDetail,
        ArtistDetailViewModel?> with ArtistDetailRef {
  _ArtistDetailProviderElement(super.provider);

  @override
  String get id => (origin as ArtistDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
