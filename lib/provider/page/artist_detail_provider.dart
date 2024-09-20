import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/model/artist_detail_model.dart';
import 'package:thinmpf/provider/page/albums_provider.dart';
import 'package:thinmpf/provider/page/songs_provider.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artist_detail_provider.g.dart';

final _artistHostApi = ArtistHostApi();

@riverpod
class ArtistDetail extends _$ArtistDetail {
  @override
  ArtistDetailModel? build() => null;

  Future<void> fetchArtistDetail(String id) async {
    final artist = await _artistHostApi.getArtistDetailById(id);

    if (artist == null) {
      return;
    }

    final albums = ref.read(albumsProvider);
    final songs = ref.read(songsProvider);
    final description = '${albums.length} albums, ${songs.length} songs';

    state = ArtistDetailModel(
      id: artist.id,
      name: artist.name,
      imageId: artist.imageId,
      description: description,
    );
  }
}
