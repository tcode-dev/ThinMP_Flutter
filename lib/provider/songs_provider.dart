import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/song.g.dart';

final songsProvider = FutureProvider((ref) async {
  final api = HostSongApi();

  return await api.findAll();
});
