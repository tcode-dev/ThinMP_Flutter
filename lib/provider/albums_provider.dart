import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'albums_provider.g.dart';

@riverpod
Future<List<Album?>> albums(AlbumsRef ref) async {
  final api = AlbumHostApi();

  return await api.getAllAlbums();
}
