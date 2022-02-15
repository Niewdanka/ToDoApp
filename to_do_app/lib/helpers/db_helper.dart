import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:to_do_app/models/note.dart';

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'test7@test.com'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE notes(id TEXT PRIMARY KEY, date TEXT, name TEXT, description TEXT, icon INTEGER, categoryName TEXT, categoryColor INTEGER, isCompleted INTEGER, time TEXT, width INTEGER)'),
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database();
    return db.query('notes');
  }

  static Future<void> insert(Map<String, Object> note) async {
    final db = await database();
    await db.insert(
      'notes',
      note,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String id) async {
    final db = await database();
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> update(Note note) async {
    final db = await database();
    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
