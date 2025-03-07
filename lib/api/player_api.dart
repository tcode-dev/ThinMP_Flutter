import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/player_api_factory_provider.dart';
import 'package:thinmpf/provider/config/player_config_factory_provider.dart';

class PlayerApi extends PlayerHostApi {
  final PlayerApiFactoryRef ref;

  PlayerApi(this.ref);

  @override
  Future<void> start(int index, List<String> ids, RepeatMode repeatMode, ShuffleMode shuffleMode) async {
    await super.start(index, ids, repeatMode, shuffleMode);
  }

  @override
  Future<void> startAlbumSongs(int index, String albumId, RepeatMode repeatMode, ShuffleMode shuffleMode) async {
    await super.startAlbumSongs(index, albumId, repeatMode, shuffleMode);
  }

  @override
  Future<void> startAllSongs(int index, RepeatMode repeatMode, ShuffleMode shuffleMode) async {
    await super.startAllSongs(index, repeatMode, shuffleMode);
  }

  @override
  Future<void> startArtistSongs(int index, String artistId, RepeatMode repeatMode, ShuffleMode shuffleMode) async {
    await super.startArtistSongs(index, artistId, repeatMode, shuffleMode);
  }

  Future<void> repeat() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);
    final repeat = await playerConfig.loadRepeat();

    await setRepeat(repeat);
  }

  Future<void> shuffle() async {
    final playerConfig = ref.read(playerConfigFactoryProvider);
    final shuffle = await playerConfig.loadShuffle();

    await setShuffle(shuffle);
  }
}
