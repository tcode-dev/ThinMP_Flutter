import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artist_songs_provider.g.dart';

@riverpod
Future<List<Song?>> artistSongs(ArtistSongsRef ref, String id) async {
  final api = SongHostApi();

  return await api.getSongsByArtistId(id);
}
