import 'package:event/dbhelper/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqfliteData {
  final _dbName = "employee.db";
  final _tablename = "users";

  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    String createTable =
        "CREATE TABLE ${_tablename}(name TEXT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL)";
    return openDatabase(
      join(path, _dbName),
      onCreate: (database, version) async {
        await database.execute(createTable);
      },
      version: 1,
    );
  }

  Future<int> insertRecord(sqfliteDbmodel data) async {
    final Database db = await initDb();
    print(data.toJson());
    var result = await db.insert(_tablename, data.toJson());
    return result;
  }
}
