import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:todo_services/data_models/dbtodo.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE MY_LIST ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "description TEXT"
          ")");
    });
  }

  addTodo(DBTodo todo) async {
    final db = await database;
    var raw = await db.rawInsert(
      "INSERT Into MY_LIST (id, title, description)"
      " VALUES(?,?,?)",
      [todo.id, todo.title, todo.description],
    );
    return raw;
  }

  Future<List<DBTodo>> getAllTodo() async {
    final db = await database;
    var res = await db.query("MY_LIST");
    List<DBTodo> list =
        res.isNotEmpty ? res.map((e) => DBTodo.fromMap(e)).toList() : [];
    return list;
  }
deleteTodoId (int id) async {
  final db = await database;
  return db.delete("MY_LIST", where: "id = ?", whereArgs: [id]);
}
}
