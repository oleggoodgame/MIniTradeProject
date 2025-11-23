import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@immutable
class CoinsDatabase {
  static const String _databaseName = 'coins.db';
  static const int _databaseVersion = 1;

  const CoinsDatabase._();
  static const instance = CoinsDatabase._();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE coins (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            symbol TEXT NOT NULL,
            baseAsset TEXT NOT NULL,
            quoteAsset TEXT NOT NULL
          )
        ''');
      },
    );
  }
}
