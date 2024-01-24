import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../plugin/get_songs.dart';
import 'package:thinmpf/channel/songs_channel.dart';
import 'package:thinmpf/pigeon_output/song.g.dart';

final songsProvider = FutureProvider((ref) async {
  // return await getSongs();
  final api = HostSongApi();

  return await api.getSongs();
});
