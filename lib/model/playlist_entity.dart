class PlaylistEntity {
  final String id;
  final String name;
  final int order;
  final List<String> songIds;

  PlaylistEntity({
    required this.id,
    required this.name,
    required this.order,
    required this.songIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sort_order': order,
    };
  }

  factory PlaylistEntity.fromMap(Map<String, dynamic> map, List<String> songIds) {
    return PlaylistEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      order: map['sort_order'] as int,
      songIds: songIds,
    );
  }

  PlaylistEntity copyWith({
    String? id,
    String? name,
    int? order,
    List<String>? songIds,
  }) {
    return PlaylistEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      songIds: songIds ?? this.songIds,
    );
  }
}
