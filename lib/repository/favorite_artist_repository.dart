// Project imports:
import 'package:thinmpf/repository/base_repository.dart';

class FavoriteArtistRepository extends BaseRepository {
  @override
  String get tableName => 'favorite_artists';

  Future<bool> existsById(String artistId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'artist_id = ?',
      whereArgs: [artistId],
    );
    return result.isNotEmpty;
  }

  Future<List<String>> findAllIds() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order ASC');
    return result.map((map) => map['artist_id'] as String).toList();
  }

  Future<bool> exists(String artistId) async {
    return existsById(artistId);
  }

  Future<void> add(String artistId) async {
    final db = await database;
    final order = await getNextOrder();
    await db.insert(tableName, {
      'artist_id': artistId,
      'sort_order': order,
    });
  }

  Future<void> delete(String artistId) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'artist_id = ?',
      whereArgs: [artistId],
    );
  }

  Future<void> update(List<String> ids) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(tableName);
      for (var i = 0; i < ids.length; i++) {
        await txn.insert(tableName, {
          'artist_id': ids[i],
          'sort_order': i + 1,
        });
      }
    });
  }

  Future<void> toggle(String artistId) async {
    if (await exists(artistId)) {
      await delete(artistId);
    } else {
      await add(artistId);
    }
  }
}
