import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../plugin/get_songs.dart';
// import 'package:thinmpf/channel/songs_channel.dart';

final songsProvider = FutureProvider((ref) async {
  return await getSongs();
});
