import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artists_provider.g.dart';

@riverpod
Future<List<Artist?>> artists(ArtistsRef ref) async {
  final api = ArtistHostApi();

  return await api.getAllArtists();
}
