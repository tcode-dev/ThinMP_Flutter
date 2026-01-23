// Package imports:
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:thinmpf/repository/database_helper.dart';

abstract class BaseRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  String get tableName;

  Future<Database> get database => _databaseHelper.database;

  Future<int> getNextOrder() async {
    final db = await database;
    final result = await db.rawQuery('SELECT MAX(sort_order) as max_order FROM $tableName');
    final maxOrder = result.first['max_order'] as int?;
    return (maxOrder ?? 0) + 1;
  }

  Future<void> truncate() async {
    final db = await database;
    await db.delete(tableName);
  }
}
