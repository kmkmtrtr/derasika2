import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._internal();
  static final AppDatabase _appDatabase = AppDatabase._internal();

  Database? _database;
  bool _initialized = false;
  static const dbName = 'data.db';

  Future<Database> get connection async {
    if (_database == null || !_initialized) {
      await _initialize();
    }
    return _database!;
  }

  factory AppDatabase() {
    return _appDatabase;
  }

  Future _initialize() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, dbName);
    _database = await openDatabase(
      path,
      version: 1,
    );
    _initialized = true;
  }
}
