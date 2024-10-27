import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/extension/shortcut_extension.dart';
import 'package:thinmpf/model/media/shortcut_model.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';
import 'package:thinmpf/provider/api/album_host_api_factory_provider.dart';
import 'package:thinmpf/provider/api/artist_host_api_factory_provider.dart';
import 'package:thinmpf/provider/api/song_host_api_factory_provider.dart';
import 'package:thinmpf/provider/repository/playlist_repository_factory_provider.dart';
import 'package:thinmpf/provider/repository/shortcut_repository_factory_provider.dart';
import 'package:thinmpf/validation/validate_entities.dart';

part 'shortcut_provider.g.dart';

@riverpod
class Shortcut extends _$Shortcut {
  @override
  List<ShortcutModel> build() => [];

  Future<void> fetch() async {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final shortcuts = shortcutRepository.findAllSortedByDesc();
    final shortcutFutures = shortcuts.map((shortcut) {
      if (shortcut.type == ShortcutConstant.artist.index) {
        return _getArtist(shortcut);
      } else if (shortcut.type == ShortcutConstant.album.index) {
        return _getAlbum(shortcut);
      } else if (shortcut.type == ShortcutConstant.playlist.index) {
        return _getPlaylist(shortcut);
      } else {
        return Future(() => null);
      }
    }).toList();

    final shortcutModels = await Future.wait(shortcutFutures);
    final filteredShortcutModels = shortcutModels.where((model) => model != null).cast<ShortcutModel>().toList();

    if (!validateEntities(shortcuts.length, filteredShortcutModels.length)) {
      fix(shortcuts, filteredShortcutModels);

      return fetch();
    }

    state = filteredShortcutModels;
  }

  void clear() {
    state = [];
  }

  void fix(List<ShortcutRealmModel> expectedShortcuts, List<ShortcutModel> actualShortcut) {
    final shortcutRepository = ref.watch(shortcutRepositoryFactoryProvider);
    final actualShortcutIds = actualShortcut.map((shortcut) => shortcut.id).toSet();
    final missingShortcuts = expectedShortcuts.where((shortcut) => !actualShortcutIds.contains(shortcut.id.toString())).toList();

    shortcutRepository.deleteByIds(missingShortcuts.map((shortcut) => shortcut.id).toList());
  }

  Future<ShortcutModel?> _getArtist(ShortcutRealmModel shortcut) async {
    final artistHostApi = ref.read(artistHostApiFactoryProvider);
    final artist = await artistHostApi.getArtistDetailById(shortcut.itemId);

    return shortcut.toShortcutArtist(artist);
  }

  Future<ShortcutModel?> _getAlbum(ShortcutRealmModel shortcut) async {
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final album = await albumHostApi.getAlbumById(shortcut.itemId);

    return shortcut.toShortcutAlbum(album);
  }

  Future<ShortcutModel?> _getPlaylist(ShortcutRealmModel shortcut) async {
    final playlistRepository = ref.watch(playlistRepositoryFactoryProvider);
    final songHostApi = ref.read(songHostApiFactoryProvider);
    final playlist = playlistRepository.findById(shortcut.itemId);

    if (playlist == null) {
      return null;
    }

    final song = playlist.songIds.isNotEmpty ? await songHostApi.getSongById(playlist.songIds.first) : null;

    return shortcut.toShortcutPlaylist(playlist, song);
  }
}
