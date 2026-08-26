import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._();
  static const String tName = 'History';
  static const cInput = 'input';
  static const cOutput = 'output';

  static final dbService = DatabaseService._();

  Database? _serviceDb;

  Future<Database?> getDb() async {
    return _serviceDb ??= await openDb();
  }

  Future<Database?> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    String path = join(dir.toString(), 'Calc.db');
    final db = await openDatabase(
      path,
      onCreate: ((db, _) => db.execute(
        'CREATE TABLE $tName (id INTEGER PRIMARY KEY AUTOINCREMENT, $cInput TEXT, $cOutput TEXT)',
      )),
      version: 1,
    );

    return db;
  }

  Future<bool?> insert({
    required String calculation,
    required String result,
  }) async {
    var db = await getDb();
    final n = await db?.insert(tName, {cInput: calculation, cOutput: result});
    return n! > 0;
  }

  Future<List<Map<String, dynamic>>> fetch() async {
    var db = await getDb();
    final result = await db?.query(tName);
    return result!;
  }

  Future<bool?> delete() async {
    var db = await getDb();
    final n = await db?.delete(tName);
    return n! > 0;
  }
}
