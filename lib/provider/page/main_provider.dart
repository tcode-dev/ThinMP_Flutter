import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/view_model/main_view_model.dart';

part 'main_provider.g.dart';

final _albumHostApi = AlbumHostApi();

@riverpod
class Main extends _$Main {
  @override
  Future<MainViewModel?> build() async {
    return fetch();
  }

  Future<MainViewModel?> fetch() async {
    final albums = await _albumHostApi.getRecentAlbums(20);
    final albumModels = albums.map((album) => album.fromPigeon()).toList();

    return MainViewModel(
      albums: albumModels,
    );
  }
}
