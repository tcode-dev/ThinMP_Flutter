import 'package:shared_preferences/shared_preferences.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

class PlayerConfig {
  static const String _repeatKey = 'repeat';
  static const String _shuffleKey = 'shuffle';

  Future<RepeatState> loadRepeat() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_repeatKey) ?? RepeatState.off.index;

    return RepeatState.values[index];
  }

  Future<void> saveRepeat(RepeatState repeat) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_repeatKey, repeat.index);
  }

  Future<bool> loadShuffle() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_shuffleKey) ?? false;
  }

  Future<void> saveShuffle(bool shuffle) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_shuffleKey, shuffle);
  }
}
