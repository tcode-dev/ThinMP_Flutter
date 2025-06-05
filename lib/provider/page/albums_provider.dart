// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/model/media/album_model.dart';
import 'package:thinmpf/provider/api/album_host_api_factory_provider.dart';

part 'albums_provider.g.dart';

@riverpod
class Albums extends _$Albums {
  @override
  List<AlbumModel> build() => [];

  Future<void> fetchAll() async {
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final albums = await albumHostApi.getAllAlbums();

    state = albums.map((album) => album.fromPigeon()).toList();
  }

  Future<void> fetchRecent() async {
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final albums = await albumHostApi.getRecentAlbums(20);

    state = albums.map((album) => album.fromPigeon()).toList();
  }

  Future<void> fetchArtistAlbums(String id) async {
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final albums = await albumHostApi.getAlbumsByArtistId(id);

    state = albums.map((album) => album.fromPigeon()).toList();
  }

  void clear() {
    state = [];
  }
}
