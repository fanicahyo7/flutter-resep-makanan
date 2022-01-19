import 'package:flutter/foundation.dart';
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
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'cookpath.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String key, String title, String thumb,
      String times, String difficulty) async {
    final db = await SQLHelper.db();

    final data = {
      'key': key,
      'title': title,
      'thumb': thumb,
      'times': times,
      'difficulty': difficulty
    };
    final id = await db.insert('resepfavorit', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('resepfavorit', orderBy: "key");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(String key) async {
    final db = await SQLHelper.db();
    return db.query('resepfavorit', where: "key = ?", whereArgs: [key], limit: 1);
  }

  // Update an item by id
  // static Future<int> updateItem(
  //     int id, String title, String? descrption) async {
  //   final db = await SQLHelper.db();

  //   final data = {
  //     'title': title,
  //     'description': descrption,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //       await db.update('items', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

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
