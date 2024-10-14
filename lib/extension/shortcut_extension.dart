import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/model/realm/playlist_realm_model.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';
import 'package:thinmpf/model/media/shortcut_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

extension ShortcutRealmModelExtension on ShortcutRealmModel {
  ShortcutModel? toShortcutArtist(ArtistDetailDTO? artist) {
    if (artist == null) {
      return null;
    }

    return ShortcutModel(
      id: id.toString(),
      itemId: itemId,
      name: artist.name,
      type: ShortcutConstant.values[type],
      imageId: artist.imageId,
    );
  }

  ShortcutModel? toShortcutAlbum(AlbumDTO? album) {
    if (album == null) {
      return null;
    }

    return ShortcutModel(
      id: id.toString(),
      itemId: itemId,
      name: album.name,
      type: ShortcutConstant.values[type],
      imageId: album.imageId,
    );
  }

  ShortcutModel? toShortcutPlaylist(PlaylistRealmModel? playlist, SongDTO? song) {
    if (playlist == null) {
      return null;
    }

    return ShortcutModel(
      id: id.toString(),
      itemId: itemId,
      name: playlist.name,
      type: ShortcutConstant.values[type],
      imageId: song?.imageId ?? '0',
    );
  }
}
