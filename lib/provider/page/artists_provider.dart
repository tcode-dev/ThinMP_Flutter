import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/favorite_artist_repository.dart';

part 'artists_provider.g.dart';

final _artistHostApi = ArtistHostApi();
final _favoriteArtistRepository = FavoriteArtistRepository();

@riverpod
class Artists extends _$Artists {
  @override
  List<ArtistModel> build() => [];

  Future<void> fetchAllArtists() async {
    final artists = await _artistHostApi.getAllArtists();

    state = artists.map((artist) => artist.fromPigeon()).toList();
  }

  Future<void> fetchFavoriteArtists() async {
    try {
      final favoriteArtists = _favoriteArtistRepository.findAll();
      final favoriteArtistIds = favoriteArtists.map((artist) => artist.artistId).toList();
      final artists = await _artistHostApi.getArtistsByIds(favoriteArtistIds);
      state = artists.map((artist) => artist.fromPigeon()).toList();
    } finally {
      _favoriteArtistRepository.destroy();
    }
  }
}
