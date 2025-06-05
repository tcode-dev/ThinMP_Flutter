// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:thinmpf/pigeon_output/audio.g.dart';

class PlayerConfig {
  static const String _repeatKey = 'repeat';
  static const String _shuffleKey = 'shuffle';

  Future<RepeatMode> loadRepeat() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_repeatKey) ?? RepeatMode.off.index;

    return RepeatMode.values[index];
  }

  Future<void> saveRepeat(RepeatMode repeat) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_repeatKey, repeat.index);
  }

  Future<ShuffleMode> loadShuffle() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_shuffleKey) ?? ShuffleMode.off.index;

    return ShuffleMode.values[index];
  }

  Future<void> saveShuffle(ShuffleMode shuffle) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_shuffleKey, shuffle.index);
  }
}
