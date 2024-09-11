import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';
import 'package:thinmpf/model/shortcut_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

extension ShortcutRealmModelExtension on ShortcutRealmModel {
  ShortcutModel? toShortcutArtist(ArtistDetail? artist) {
    if (artist == null) {
      return null;
    }

    return ShortcutModel(
      id: id.toString(),
      itemId: itemId,
      name: artist.name,
      type: ShortcutItemType.values[type],
      imageId: artist.imageId,
    );
  }
}
