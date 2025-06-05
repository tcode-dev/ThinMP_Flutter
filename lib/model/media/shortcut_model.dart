// Project imports:
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/l10n/app_localizations.dart';

class ShortcutModel {
  ShortcutModel({
    required this.id,
    required this.itemId,
    required this.name,
    required this.imageId,
    required this.type,
  });

  final String id;
  final String itemId;
  final String name;
  final String imageId;
  final ShortcutConstant type;
  String getDescription(AppLocalizations localizations) {
    switch (type) {
      case ShortcutConstant.artist:
        return localizations.artist;
      case ShortcutConstant.album:
        return localizations.album;
      case ShortcutConstant.playlist:
        return localizations.playlist;
      default:
        throw UnsupportedError('Unsupported shortcut type: $type');
    }
  }
}
