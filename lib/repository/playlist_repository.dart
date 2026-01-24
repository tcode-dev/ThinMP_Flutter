// Package imports:
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:thinmpf/model/playlist_entity.dart';
import 'package:thinmpf/repository/base_repository.dart';

class PlaylistRepository extends BaseRepository {
  @override
  String get tableName => 'playlists';

  static const String _songTableName = 'playlist_songs';

  Future<PlaylistEntity?> findById(String playlistId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [playlistId],
    );
    if (result.isEmpty) return null;

    final songIds = await _getSongIds(playlistId);
    return PlaylistEntity.fromMap(result.first, songIds);
  }

  Future<List<PlaylistEntity>> findAll() async {
    final db = await database;
    final result = await db.query(tableName);
    final playlists = <PlaylistEntity>[];
    for (final map in result) {
      final playlistId = map['id'] as String;
      final songIds = await _getSongIds(playlistId);
      playlists.add(PlaylistEntity.fromMap(map, songIds));
    }
    return playlists;
  }

  Future<List<PlaylistEntity>> findAllSortedByAsc() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order ASC');
    final playlists = <PlaylistEntity>[];
    for (final map in result) {
      final playlistId = map['id'] as String;
      final songIds = await _getSongIds(playlistId);
      playlists.add(PlaylistEntity.fromMap(map, songIds));
    }
    return playlists;
  }

  Future<List<PlaylistEntity>> findAllSortedByDesc() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order DESC');
    final playlists = <PlaylistEntity>[];
    for (final map in result) {
      final playlistId = map['id'] as String;
      final songIds = await _getSongIds(playlistId);
      playlists.add(PlaylistEntity.fromMap(map, songIds));
    }
    return playlists;
  }

  Future<bool> exists(String playlistId, String songId) async {
    final model = await findById(playlistId);
    if (model == null) return false;
    return model.songIds.contains(songId);
  }

  Future<void> create(String name, String songId) async {
    final db = await database;
    final id = const Uuid().v4();
    final order = await getNextOrder();

    await db.transaction((txn) async {
      await txn.insert(tableName, {
        'id': id,
        'name': name,
        'sort_order': order,
      });
      await txn.insert(_songTableName, {
        'playlist_id': id,
        'song_id': songId,
        'sort_order': 1,
      });
    });
  }

  Future<void> add(String playlistId, String songId) async {
    final db = await database;
    final nextOrder = await _getNextSongOrder(playlistId);
    await db.insert(_songTableName, {
      'playlist_id': playlistId,
      'song_id': songId,
      'sort_order': nextOrder,
    });
  }

  Future<void> updatePlaylists(List<String> ids) async {
    final db = await database;
    final idSet = ids.toSet();
    final models = await findAll();
    final deleteIds = models.where((model) => !idSet.contains(model.id)).map((model) => model.id).toList();

    await db.transaction((txn) async {
      for (final id in deleteIds) {
        await txn.delete(_songTableName, where: 'playlist_id = ?', whereArgs: [id]);
        await txn.delete(tableName, where: 'id = ?', whereArgs: [id]);
      }

      for (var i = 0; i < ids.length; i++) {
        await txn.update(
          tableName,
          {'sort_order': i + 1},
          where: 'id = ?',
          whereArgs: [ids[i]],
        );
      }
    });
  }

  Future<void> updatePlaylistDetail(String playlistId, String name, List<String> songIds) async {
    final db = await database;

    await db.transaction((txn) async {
      await txn.update(
        tableName,
        {'name': name},
        where: 'id = ?',
        whereArgs: [playlistId],
      );

      await txn.delete(_songTableName, where: 'playlist_id = ?', whereArgs: [playlistId]);

      for (var i = 0; i < songIds.length; i++) {
        await txn.insert(_songTableName, {
          'playlist_id': playlistId,
          'song_id': songIds[i],
          'sort_order': i + 1,
        });
      }
    });
  }

  Future<void> delete(String playlistId) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(_songTableName, where: 'playlist_id = ?', whereArgs: [playlistId]);
      await txn.delete(tableName, where: 'id = ?', whereArgs: [playlistId]);
    });
  }

  Future<List<String>> _getSongIds(String playlistId) async {
    final db = await database;
    final result = await db.query(
      _songTableName,
      where: 'playlist_id = ?',
      whereArgs: [playlistId],
      orderBy: 'sort_order ASC',
    );
    return result.map((map) => map['song_id'] as String).toList();
  }

  Future<int> _getNextSongOrder(String playlistId) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT MAX(sort_order) as max_order FROM $_songTableName WHERE playlist_id = ?',
      [playlistId],
    );
    final maxOrder = result.first['max_order'] as int?;
    return (maxOrder ?? 0) + 1;
  }
}
