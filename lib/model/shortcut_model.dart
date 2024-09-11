import 'package:thinmpf/constant/shortcut_item_type.dart';

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
  final ShortcutItemType type;
}
