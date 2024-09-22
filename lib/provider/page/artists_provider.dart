import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/repository/favorite_artist_repository_factory_provider.dart';

part 'artists_provider.g.dart';

final _artistHostApi = ArtistHostApi();

@riverpod
class Artists extends _$Artists {
  @override
  List<ArtistModel> build() => [];

  Future<void> fetchAllArtists() async {
    final artists = await _artistHostApi.getAllArtists();

    state = artists.map((artist) => artist.fromPigeon()).toList();
  }

  Future<void> fetchFavoriteArtists() async {
    final favoriteArtistRepository = ref.read(favoriteArtistRepositoryFactoryProvider);
    final favoriteArtists = favoriteArtistRepository.findAll();
    final favoriteArtistIds = favoriteArtists.map((artist) => artist.artistId).toList();
    final artists = await _artistHostApi.getArtistsByIds(favoriteArtistIds);

    state = artists.map((artist) => artist.fromPigeon()).toList();
  }
}
