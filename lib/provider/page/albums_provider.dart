import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'albums_provider.g.dart';

final _api = AlbumHostApi();

@riverpod
class Albums extends _$Albums {
  @override
  List<AlbumModel> build() => [];

  Future<void> fetchAll() async {
    final albums = await _api.getAllAlbums();

    state = albums.map((album) => album.fromPigeon()).toList();
  }

  Future<void> fetchRecent() async {
    final albums = await _api.getRecentAlbums(20);

    state = albums.map((album) => album.fromPigeon()).toList();
  }
}
