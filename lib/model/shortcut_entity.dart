class ShortcutEntity {
  final String id;
  final String itemId;
  final int type;
  final int order;

  ShortcutEntity({
    required this.id,
    required this.itemId,
    required this.type,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item_id': itemId,
      'type': type,
      'sort_order': order,
    };
  }

  factory ShortcutEntity.fromMap(Map<String, dynamic> map) {
    return ShortcutEntity(
      id: map['id'] as String,
      itemId: map['item_id'] as String,
      type: map['type'] as int,
      order: map['sort_order'] as int,
    );
  }
}
