import 'package:thinmpf/pigeon_output/player.g.dart';

class PlayerFlutterApiImpl implements PlayerFlutterApi {
  @override
  void playbackStateChange(String str) {
    print(str);
  }
}