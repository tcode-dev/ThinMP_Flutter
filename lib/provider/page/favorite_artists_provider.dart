import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';
import 'package:thinmpf/view_model/favorite_artists_view_model.dart';

part 'favorite_artists_provider.g.dart';

final _artistHostApi = ArtistHostApi();

@riverpod
class FavoriteArtists extends _$FavoriteArtists {
  @override
  Future<FavoriteArtistsViewModel> build() async {
    return fetchArtists();
  }

  Future<FavoriteArtistsViewModel> fetchArtists() async {
    final favoriteArtistRepository = FavoriteArtistRepository();

    try {
      final favoriteArtists = favoriteArtistRepository.findAll();
      final favoriteArtistIds = favoriteArtists.map((artist) => artist.artistId).toList();
      final artists = await _artistHostApi.getArtistsByIds(favoriteArtistIds);
      final artistModels = artists.map((artist) => artist.fromPigeon()).toList();

      return FavoriteArtistsViewModel(artists: artistModels);
    } finally {
      favoriteArtistRepository.destroy();
    }
  }
}
