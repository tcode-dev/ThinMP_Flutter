import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/song_extension.dart';
import 'package:thinmpf/view_model/album_detail_view_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'album_detail_provider.g.dart';

final _songHostApi = SongHostApi();
final _albumHostApi = AlbumHostApi();

@riverpod
class AlbumDetail extends _$AlbumDetail {
  @override
  Future<AlbumDetailViewModel> build(String id) async {
    return fetchAlbumDetail(id);
  }

  Future<AlbumDetailViewModel> fetchAlbumDetail(String id) async {
    final album = await _albumHostApi.getAlbumById(id);
    final songs = await _songHostApi.getSongsByAlbumId(id);
    final songModels = songs.map((song) => song.fromPigeon()).toList();

    return AlbumDetailViewModel(
      id: album!.id,
      name: album.name,
      artistId: album.artistId,
      artistName: album.artistName,
      imageId: album.imageId,
      songs: songModels,
    );
  }
}
