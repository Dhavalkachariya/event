import 'package:event/dbhelper/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqfliteDatabase {
  final _dbName = "customer.db";
  final _tablename = "admin";

  final String columnName = "name";
  final String columnUserName = "email";
  final String columnPassword = "password";

  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    String createTable =
        "CREATE TABLE $_tablename($columnName TEXT NOT NULL,$columnUserName TEXT NOT NULL,$columnPassword TEXT NOT NULL)";
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

  Future<sqfliteDbmodel?> getLoginUser(String email, String password) async {
    final Database db = await initDb();
    var result = await db.rawQuery("SELECT * FROM $_tablename WHERE "
        "$columnUserName == '$email' AND "
        "$columnPassword == '$password'");

    if (result.isNotEmpty) {
      return sqfliteDbmodel.fromJson(result.first);
    }

    return null;
  }
}
