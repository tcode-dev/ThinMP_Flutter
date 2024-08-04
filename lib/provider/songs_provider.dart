import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'songs_provider.g.dart';

@riverpod
Future<List<Song?>> songs(SongsRef ref) async {
  final api = SongHostApi();

  return await api.findAll();
}
