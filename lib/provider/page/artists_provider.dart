// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/model/media/artist_model.dart';
import 'package:thinmpf/provider/api/artist_host_api_factory_provider.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';
import 'package:thinmpf/validation/validate_entities.dart';

part 'artists_provider.g.dart';

@riverpod
class Artists extends _$Artists {
  @override
  List<ArtistModel> build() => [];

  Future<void> fetchAllArtists() async {
    final artistHostApi = ref.read(artistHostApiFactoryProvider);
    final artists = await artistHostApi.getAllArtists();

    state = artists.map((artist) => artist.fromPigeon()).toList();
  }

  Future<void> fetchFavoriteArtists() async {
    final favoriteArtistRepository = ref.watch(favoriteArtistRepositoryFactoryProvider);
    final artistHostApi = ref.read(artistHostApiFactoryProvider);
    final favoriteArtists = favoriteArtistRepository.findAll();
    final favoriteArtistIds = favoriteArtists.map((artist) => artist.artistId).toList();
    final artists = await artistHostApi.getArtistsByIds(favoriteArtistIds);

    if (!validateEntities(favoriteArtists.length, artists.length)) {
      favoriteArtistRepository.update(artists.map((artist) => artist.id).toList());

      return fetchFavoriteArtists();
    }

    final artistModels = artists.map((artist) => artist.fromPigeon()).toList();
    state = favoriteArtistIds.map((id) => artistModels.firstWhere((artist) => artist.id == id)).toList();
  }
}
