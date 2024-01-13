import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/channel/songs_channel.dart';

final songsProvider = FutureProvider((ref) async {
  return await getSongs();
});
