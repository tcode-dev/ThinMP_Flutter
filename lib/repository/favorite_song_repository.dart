// Project imports:
import 'package:thinmpf/repository/base_repository.dart';

class FavoriteSongRepository extends BaseRepository {
  @override
  String get tableName => 'favorite_songs';

  Future<bool> existsById(String songId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'song_id = ?',
      whereArgs: [songId],
    );
    return result.isNotEmpty;
  }

  Future<List<String>> findAllIds() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order ASC');
    return result.map((map) => map['song_id'] as String).toList();
  }

  Future<bool> exists(String songId) async {
    return existsById(songId);
  }

  Future<void> add(String songId) async {
    final db = await database;
    final order = await getNextOrder();
    await db.insert(tableName, {
      'song_id': songId,
      'sort_order': order,
    });
  }

  Future<void> delete(String songId) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'song_id = ?',
      whereArgs: [songId],
    );
  }

  Future<void> update(List<String> ids) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(tableName);
      for (var i = 0; i < ids.length; i++) {
        await txn.insert(tableName, {
          'song_id': ids[i],
          'sort_order': i + 1,
        });
      }
    });
  }

  Future<void> toggle(String songId) async {
    if (await exists(songId)) {
      await delete(songId);
    } else {
      await add(songId);
    }
  }
}
