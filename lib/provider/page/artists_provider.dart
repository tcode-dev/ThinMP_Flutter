import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view_model/artists_view_model.dart';

part 'artists_provider.g.dart';

final _api = ArtistHostApi();

@riverpod
class Artists extends _$Artists {
  @override
  Future<ArtistsViewModel> build() async {
    return fetchArtists();
  }

  Future<ArtistsViewModel> fetchArtists() async {
    final artists = await _api.getAllArtists();
    final artistModels = artists.map((artist) => artist.fromPigeon()).toList();

    return ArtistsViewModel(
      artists: artistModels,
    );
  }
}
