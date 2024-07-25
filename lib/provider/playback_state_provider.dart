import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thinmpf/pigeon_output/player.g.dart';

final playbackStateProvider = StateProvider<PlaybackState>((ref) => PlaybackState(isPlaying: false));
