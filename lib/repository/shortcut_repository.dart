// Package imports:
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/model/shortcut_entity.dart';
import 'package:thinmpf/repository/base_repository.dart';

class ShortcutRepository extends BaseRepository {
  @override
  String get tableName => 'shortcuts';

  Future<ShortcutEntity?> findById(String id) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) return null;
    return ShortcutEntity.fromMap(result.first);
  }

  Future<List<ShortcutEntity>> findAll() async {
    final db = await database;
    final result = await db.query(tableName);
    return result.map((map) => ShortcutEntity.fromMap(map)).toList();
  }

  Future<List<ShortcutEntity>> findAllSortedByAsc() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order ASC');
    return result.map((map) => ShortcutEntity.fromMap(map)).toList();
  }

  Future<List<ShortcutEntity>> findAllSortedByDesc() async {
    final db = await database;
    final result = await db.query(tableName, orderBy: 'sort_order DESC');
    return result.map((map) => ShortcutEntity.fromMap(map)).toList();
  }

  Future<bool> exists(String itemId, ShortcutConstant type) async {
    final model = await _find(itemId, type);
    return model != null;
  }

  Future<void> add(String itemId, ShortcutConstant type) async {
    final db = await database;
    final id = const Uuid().v4();
    final order = await getNextOrder();
    final model = ShortcutEntity(id: id, itemId: itemId, type: type.index, order: order);
    await db.insert(tableName, model.toMap());
  }

  Future<void> toggle(String itemId, ShortcutConstant type) async {
    if (await exists(itemId, type)) {
      await delete(itemId, type);
    } else {
      await add(itemId, type);
    }
  }

  Future<void> update(List<String> ids) async {
    final db = await database;
    final idSet = ids.toSet();
    final models = await findAll();
    final deleteIds = models.where((model) => !idSet.contains(model.id)).map((model) => model.id).toList();

    await db.transaction((txn) async {
      for (final id in deleteIds) {
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

  Future<void> delete(String itemId, ShortcutConstant type) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'item_id = ? AND type = ?',
      whereArgs: [itemId, type.index],
    );
  }

  Future<void> deleteByIds(List<String> ids) async {
    final db = await database;
    await db.transaction((txn) async {
      for (final id in ids) {
        await txn.delete(tableName, where: 'id = ?', whereArgs: [id]);
      }
    });
  }

  Future<ShortcutEntity?> _find(String itemId, ShortcutConstant type) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'item_id = ? AND type = ?',
      whereArgs: [itemId, type.index],
    );
    if (result.isEmpty) return null;
    return ShortcutEntity.fromMap(result.first);
  }
}
