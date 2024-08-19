import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/view_model/artist_detail_view_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artist_detail_provider.g.dart';

final _songHostApi = SongHostApi();
final _albumHostApi = AlbumHostApi();

@riverpod
class ArtistDetail extends _$ArtistDetail {
  @override
  Future<ArtistDetailViewModel> build(String id) async {
    return fetchArtistDetail(id);
  }

  Future<ArtistDetailViewModel> fetchArtistDetail(String id) async {
    final songs = await _songHostApi.getSongsByArtistId(id);
    final albums = await _albumHostApi.getAlbumsByArtistId(id);
    final albumModels = albums.map((album) => album.fromPigeon()).toList();
    final songModels = songs.map((song) => song.fromPigeon()).toList();

    return ArtistDetailViewModel(
      albums: albumModels,
      songs: songModels,
    );
  }
}
