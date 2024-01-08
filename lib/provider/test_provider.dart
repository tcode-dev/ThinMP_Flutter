import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/plugin/songs_plugin.dart';

final testProvider = FutureProvider((ref) async {
  return await getTest();
});
