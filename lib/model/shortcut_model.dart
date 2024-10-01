import 'package:thinmpf/constant/shortcut_constant.dart';

class ShortcutModel {
  ShortcutModel({
    required this.id,
    required this.itemId,
    required this.name,
    required this.imageId,
    required this.type,
  }): dedcription = type == ShortcutConstant.artist
        ? 'Artist'
        : type == ShortcutConstant.album
            ? 'Album'
            : 'Playlist';

  final String id;
  final String itemId;
  final String name;
  final String dedcription;
  final String imageId;
  final ShortcutConstant type;
}
