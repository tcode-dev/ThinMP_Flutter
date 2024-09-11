import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/extension/shortcut_extension.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';
import 'package:thinmpf/repository/shortcut_repository.dart';
import 'package:thinmpf/view_model/main_view_model.dart';

part 'main_provider.g.dart';

final _albumHostApi = AlbumHostApi();
final _shortcutRepository = ShortcutRepository();
final _artistHostApi = ArtistHostApi();

@riverpod
class Main extends _$Main {
  @override
  Future<MainViewModel> build() async {
    return fetch();
  }

  Future<MainViewModel> fetch() async {
    final albums = await _albumHostApi.getRecentAlbums(20);
    final albumModels = albums.map((album) => album.fromPigeon()).toList();
    final shortcuts = _shortcutRepository.findAll();
    final shortcutFutures = shortcuts.map((shortcut) async {
      if (shortcut.type == ShortcutItemType.artist.index) {
        final artist = await _artistHostApi.getArtistDetailById(shortcut.itemId);

        return shortcut.toShortcutArtist(artist);
      } else if (shortcut.type == ShortcutItemType.album.index) {
          final album = await _albumHostApi.getAlbumById(shortcut.itemId);

        return shortcut.toShortcutAlbum(album);
      }
    }).toList();
    final shortcutModels = await Future.wait(shortcutFutures);
    final filteredShortcutModels = shortcutModels.where((model) => model != null).cast<ShortcutModel>().toList();

    return MainViewModel(
      shortcuts: filteredShortcutModels,
      albums: albumModels,
    );
  }
}
