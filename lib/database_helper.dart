import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    _database ??= await _initDB('gitsawe.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE gitsawe (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ቀን TEXT,
        የጳውሎስ_መልእክት TEXT,
        መልእክት TEXT,
        የሐዋርያት_ሥራ TEXT,
        መዝሙረ_ዳዊት TEXT,
        ወንጌል TEXT,
        ቅዳሴ TEXT
      )
    ''');
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert('gitsawe', data);
  }

  Future<Map<String, dynamic>?> getDataByDate(String date) async {
    final db = await instance.database;
    final result = await db.query(
      'gitsawe',
      where: 'ቀን = ?',
      whereArgs: [date],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
