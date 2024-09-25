import 'package:thinmpf/config/player_config.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';

class PlayerApi extends PlayerHostApi {
  final PlayerApiFactoryRef ref;

  PlayerApi(this.ref);

  @override
  Future<void> start(int index, List<String> ids) async {
    await super.start(index, ids);
    await setMode();
  }

  @override
  Future<void> startAlbumSongs(int index, String albumId) async {
    await super.startAlbumSongs(index, albumId);
    await setMode();
  }

  @override
  Future<void> startAllSongs(int index) async {
    await super.startAllSongs(index);
    await setMode();
  }

  @override
  Future<void> startArtistSongs(int index, String artistId) async {
    await super.startArtistSongs(index, artistId);
    await setMode();
  }

  Future<void> setMode() async {
    await repeat();
    await shuffle();
  }

  Future<void> repeat() async {
    final playerConfig = PlayerConfig();
    final repeat = await playerConfig.loadRepeat();

    await setRepeat(repeat);
  }

  Future<void> shuffle() async {
    final playerConfig = PlayerConfig();
    final shuffle = await playerConfig.loadShuffle();

    await setShuffle(shuffle);
  }
}
