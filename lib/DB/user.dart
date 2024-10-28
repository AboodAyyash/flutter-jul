// ignore_for_file: prefer_const_declarations

import 'package:flutterjul/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterjul/shared/shared.dart';

class UserFields {
  static final List<String> values = [
    id,
    name,
    email,
    password,
    age,
  ];

  static final String id = 'id';
  static final String email = 'email';
  static final String password = 'password';
  static final String name = 'name';
  static final String age = 'age';
}

final tableUsers = 'users';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {


    await db.execute('''
CREATE TABLE $tableUsers ( 
  ${UserFields.id} $idType, 
  ${UserFields.name} $textType,
  ${UserFields.email} $textType,
  ${UserFields.password} $textType,  
  ${UserFields.age} $textType
  )
''');
  }

  Future<int> create(UserModel user) async {
    final db = await instance.database;

/*     await db.rawInsert(
        'INSERT INTO $tableUsers(${UserFields.name}, ${UserFields.userId}) VALUES(?, ?)',
        [User.name, User.userId]); */

    final result = db.insert(tableUsers, user.toMap());

    return result;
  }

  Future<int> update(UserModel user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toMap(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await instance.database;

    final results = await db.query(tableUsers);
    // ignore: avoid_print
    print(results);
    return results.map((json) => UserModel.fromMap(json)).toList();
  }
}