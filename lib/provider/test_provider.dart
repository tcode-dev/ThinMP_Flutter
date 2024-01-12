import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/channel/songs_channel.dart';

final testProvider = FutureProvider((ref) async {
  return await getSongs();
});
