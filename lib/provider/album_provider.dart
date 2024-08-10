import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'album_provider.g.dart';

@riverpod
Future<Album?> album(AlbumRef ref, String id) async {
  final api = AlbumHostApi();

  return await api.getAlbumById(id);
}
