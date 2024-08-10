import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artist_albums_provider.g.dart';

@riverpod
Future<List<Album?>> artistAlbums(ArtistAlbumsRef ref, String id) async {
  final api = AlbumHostApi();

  return await api.getAlbumsByArtistId(id);
}
