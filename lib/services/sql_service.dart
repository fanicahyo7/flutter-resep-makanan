import 'package:flutter/foundation.dart';
import 'package:flutter_resep_makanan/models/resep.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE resepfavorit(
        key TEXT PRIMARY KEY NOT NULL,
        title TEXT,
        thumb TEXT,
        times TEXT,
        difficulty TEXT
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'cookpath.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<void> createItem(Resep resep) async {
    final db = await SQLHelper.db();

    await db.insert('resepfavorit', resep.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  // Read all items
  static Future<List<Resep>> getItems() async {
    final db = await SQLHelper.db();
    final maps = await db.query('resepfavorit', orderBy: "key");
    return List.generate(maps.length, (i) {
      return Resep(
          key: maps[i]['key'] as String,
          title: maps[i]['title'] as String,
          thumb: maps[i]['thumb'] as String,
          times: maps[i]['times'] as String);
    });
  }

  // Read a single item by id
  static Future<Resep> getItem(String key) async {
    final db = await SQLHelper.db();
    final maps = await db.query('resepfavorit',
        where: "key = ?", whereArgs: [key], limit: 1);
    if (maps.isNotEmpty) {
      return Resep(
          key: maps[0]['key'] as String,
          title: maps[0]['title'] as String,
          thumb: maps[0]['thumb'] as String,
          times: maps[0]['times'] as String);
    }
    return Resep(key: '', title: '', thumb: '', times: '');
  }

  // Delete
  static Future<void> deleteItem(String key) async {
    final db = await SQLHelper.db();

    try {
      await db.delete("resepfavorit", where: "key = ?", whereArgs: [key]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
