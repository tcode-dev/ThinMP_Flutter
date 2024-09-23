import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/extension/shortcut_extension.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/provider/api/album_host_api_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/repository/playlist_repository.dart';

part 'shortcut_provider.g.dart';

final _songHostApi = SongHostApi();
final _artistHostApi = ArtistHostApi();
final _playlistRepository = PlaylistRepository();

@riverpod
class Shortcut extends _$Shortcut {
  @override
  List<ShortcutModel> build() => [];

  Future<void> fetch() async {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final shortcuts = shortcutRepository.findAllSortedByDesc();
    final shortcutFutures = shortcuts.map((shortcut) async {
      if (shortcut.type == ShortcutConstant.artist.index) {
        final artist = await _artistHostApi.getArtistDetailById(shortcut.itemId);

        return shortcut.toShortcutArtist(artist);
      } else if (shortcut.type == ShortcutConstant.album.index) {
        final album = await albumHostApi.getAlbumById(shortcut.itemId);

        return shortcut.toShortcutAlbum(album);
      } else if (shortcut.type == ShortcutConstant.playlist.index) {
        final playlist = _playlistRepository.findById(shortcut.itemId);
        final song = await _songHostApi.getSongById(playlist!.songIds.first);

        return shortcut.toShortcutPlaylist(playlist, song);
      }
    }).toList();

    final shortcutModels = await Future.wait(shortcutFutures);
    final filteredShortcutModels = shortcutModels.where((model) => model != null).cast<ShortcutModel>().toList();

    state = filteredShortcutModels;
  }
}
