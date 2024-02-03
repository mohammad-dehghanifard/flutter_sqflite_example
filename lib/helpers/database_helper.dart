import 'package:flutter_sqflite_examle/helpers/encrypt_data.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper extends EncryptData {
  static final DatabaseHelper _singleton = DatabaseHelper._internal();
  factory DatabaseHelper() => _singleton;
  DatabaseHelper._internal();

  static const dbName = 'users_db';
  static Database? _database;

  //database version
  static int dbVersion = 1;
  // get database instance
  Future<Database> get database async {
    if(_database != null){
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }
  // initial database
  Future<Database> initDatabase() async {
    encInitialZer();
    final dbPath = getDatabasesPath();
    return await openDatabase(
      '$dbPath/${DatabaseHelper.dbName}',
        version: DatabaseHelper.dbVersion,
        onCreate: _createTable
    );
  }
  // create table
  Future<void> _createTable(Database db,version) async {
    await db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, userid Text');
  }
  // insert user
  Future<void> insertNewUser({required String username,required String userId}) async {
    final db = await database;
    await db.insert("users",{'name' : username,"userid" : encrypt(userId)});
  }
  // get all data
  Future<List<Map<String,dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query("users");
  }
}
