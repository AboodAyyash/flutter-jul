// ignore_for_file: prefer_const_declarations, avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterjul/DB/category.dart';
import 'package:flutterjul/DB/user.dart';
import 'package:flutterjul/models/task.dart';
import 'package:flutterjul/shared/shared.dart';

const tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [
    id,
    name,
    description,
    deadline,
    createdDate,
    categoryId,
    isChecked,
    userId,
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String description = 'description';
  static final String deadline = 'deadline';
  static final String createdDate = 'createdDate';
  static final String categoryId = 'categoryId';
  static final String isChecked = 'isChecked';
  static final String userId = 'userId';
}

class TaskDatabase {
  static final TaskDatabase instance = TaskDatabase._init();

  static Database? _database;

  TaskDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableTasks (
  ${TaskFields.id} $idType,
  ${TaskFields.name} $textType,
  ${TaskFields.description} $textType,
  ${TaskFields.deadline} $textType,
  ${TaskFields.createdDate} $textType,
  ${TaskFields.categoryId} $integerType,
  ${TaskFields.isChecked} $integerType,
  ${TaskFields.userId} $integerType)          
''');
  }

  Future<int> create(Map<String, Object> task) async {
    final db = await instance.database;

    final result = await db.insert(tableTasks, task);

    return result;
  }

  Future<int> update(Map<String, Object> task) async {
    final db = await instance.database;

    return db.update(
      tableTasks,
      task,
      where: '${TaskFields.id} = ?',
      whereArgs: [task['id']],
    );
  }

  Future<int> delete(Map<String, Object> task) async {
    final db = await instance.database;

    return db.delete(
      tableTasks,
      where: '${TaskFields.id} = ?',
      whereArgs: [task['id']],
    );
  }

  Future getAllTasks() async {
    final db = await instance.database;

    final results = await db.query(tableTasks);
    return results;
  }
}
