import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view_model/albums_view_model.dart';

part 'albums_provider.g.dart';

final _api = AlbumHostApi();

@riverpod
class Albums extends _$Albums {
  @override
  Future<AlbumsViewModel> build() async {
    return fetchAlbums();
  }

  Future<AlbumsViewModel> fetchAlbums() async {
    final albums = await _api.getAllAlbums();
    final albumModels = albums.map((album) => album.fromPigeon()).toList();

    return AlbumsViewModel(
      albums: albumModels,
    );
  }
}
