import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {

  static final DBHelper _instance = DBHelper._();
  static DBHelper get instance => _instance;
  DBHelper._();

  static final String TABLE_T  = 'table_t';

  static final String COLUMN_TODO = 'todo_text';
  static final String columnSNO = 'column_SNO';
  static final String columnIsDone = 'is_done';
  static final String columnIsToday = 'is_today';

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'clean_todo_app.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {

    await db.execute(
        "CREATE TABLE $TABLE_T ( $columnSNO INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_TODO TEXT, $columnIsDone INTEGER DEFAULT 0, $columnIsToday INTEGER DEFAULT 1)"
    );
  }


  Future<List<Map<String, dynamic>>> getTableData () async {
    final db = await database;
    return await db.query(TABLE_T);
  }


  Future<int> addTodo(String todo, bool isToday ) async {
    final db = await database;
    return await db.insert(TABLE_T, {
      COLUMN_TODO: todo,
      columnIsDone: 0,
      columnIsToday: isToday
    });
  }

  Future<int> updateTodoStatus( int sno, bool isDone) async {
    final db = await database;

    return await db.update(
      TABLE_T,
      {columnIsDone: isDone ? 1 : 0},
      where: '$columnSNO = ?',
      whereArgs: [sno],
    );
  }


  Future<int> deleteTodo( int sno) async {
    final db = await database;
    return await db.delete(
      TABLE_T,
      where: '$columnSNO = ?',
      whereArgs: [sno],
    );
  }

  Future<int> updateTodoDay ( int sno, bool isToday) async {
    final db = await database;

    return await db.update(
      TABLE_T,
      {columnIsToday: isToday ? 1 : 0},
      where: '$columnSNO = ?',
      whereArgs: [sno],
    );
  }

  Future<int> updateTodo ( int sno, String newTodo) async {
    final db = await database;

    return await db.update(
      TABLE_T,
      {COLUMN_TODO: newTodo},
      where: '$columnSNO = ?',
      whereArgs: [sno],
    );
  }



}

