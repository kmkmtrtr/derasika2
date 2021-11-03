import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._internal();
  static final AppDatabase appDatabase = AppDatabase._internal();

  Database? database;
  bool initialized = false;
  static const dbName = 'data.db';

  Future<Database> get connection async {
    if (database == null || !initialized) {
      await _initialize();
    }
    return database!;
  }

  factory AppDatabase() {
    return appDatabase;
  }

  Future _initialize() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, dbName);
    database = await openDatabase(
      path,
      version: 1,
    );
    initialized = true;
  }
}
