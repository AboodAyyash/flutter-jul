import 'package:flutterjul/models/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CategoryFields {
  static final List<String> values = [
    id,
    name,
    userId,
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String userId = 'userId';
}

final tableCategories = 'categories';

class CategoryDatabase {
  static final CategoryDatabase instance = CategoryDatabase._init();

  static Database? _database;

  CategoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('category.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableCategories ( 
  ${CategoryFields.id} $idType, 
  ${CategoryFields.name} $textType,
  ${CategoryFields.userId} $integerType
  )
''');
  }

  Future<int> create(Category category) async {
    final db = await instance.database;

    await db.rawInsert(
        'INSERT INTO $tableCategories(${CategoryFields.name}, ${CategoryFields.userId}) VALUES(?, ?)',
        [category.name, category.userId]);

    final result = db.insert(tableCategories, category.toMap());

    return result;
  }

  Future<int> update(Category category) async {
    final db = await instance.database;

    return db.update(
      tableCategories,
      category.toMap(),
      where: '${CategoryFields.id} = ?',
      whereArgs: [category.id],
    );
  }
}